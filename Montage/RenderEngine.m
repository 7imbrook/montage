//
//  RenderEngine.m
//  Montage
//
//  Created by Michael Timbrook on 8/25/13.
//  Copyright (c) 2013 Michael Timbrook. All rights reserved.
//

#import "RenderEngine.h"

@interface RenderEngine ()

@property (assign) PhotoManager *manager;

@end

@implementation RenderEngine

+ (instancetype)rendererWithPhotoManager:(PhotoManager *)manager
{
    RenderEngine *new = [self.class new];
    new.manager = manager;
    return new;
}

- (BOOL)start // Rough test code, will be cleaned up
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    NSString *url = [basePath stringByAppendingString:@"/temp.mov"];
    NSURL *fileURL = [NSURL fileURLWithPath:url isDirectory:NO];
    
    NSError *error;
    AVAssetWriter *videoWriter = [AVAssetWriter assetWriterWithURL:fileURL
                                                           fileType:AVFileTypeQuickTimeMovie
                                                              error:&error];
    
    NSDictionary *outputSettings = @{ AVVideoCodecKey : AVVideoCodecH264,
                                      AVVideoHeightKey : @460,
                                      AVVideoWidthKey : @460 };
    
    AVAssetWriterInput *writer = [AVAssetWriterInput assetWriterInputWithMediaType:AVMediaTypeVideo outputSettings:outputSettings];
    
    [videoWriter addInput:writer];
    
    [videoWriter startWriting];
    [videoWriter startSessionAtSourceTime:kCMTimeZero];
    
    // Write Stuff
    
    [videoWriter finishWritingWithCompletionHandler:^{
        NSLog(@"Done");
    }];
    
    return YES;
}

- (CVPixelBufferRef) pixelBufferFromCGImage: (CGImageRef) image {
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:YES], kCVPixelBufferCGImageCompatibilityKey,
                             [NSNumber numberWithBool:YES], kCVPixelBufferCGBitmapContextCompatibilityKey,
                             nil];
    CVPixelBufferRef pxbuffer = NULL;
    
    CVPixelBufferCreate(kCFAllocatorDefault, CGImageGetWidth(image),
                        CGImageGetHeight(image), kCVPixelFormatType_32ARGB, (__bridge CFDictionaryRef) options,
                        &pxbuffer);
    
    CVPixelBufferLockBaseAddress(pxbuffer, 0);
    void *pxdata = CVPixelBufferGetBaseAddress(pxbuffer);
    
    CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(pxdata, CGImageGetWidth(image),
                                                 CGImageGetHeight(image), 8, 4*CGImageGetWidth(image), rgbColorSpace,
                                                 kCGImageAlphaNoneSkipFirst);
    
    CGContextConcatCTM(context, CGAffineTransformMakeRotation(0));
    
    
    CGContextDrawImage(context, CGRectMake(0, 0, CGImageGetWidth(image),
                                           CGImageGetHeight(image)), image);
    CGColorSpaceRelease(rgbColorSpace);
    CGContextRelease(context);
    
    CVPixelBufferUnlockBaseAddress(pxbuffer, 0);
    
    return pxbuffer;
}

@end
