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
    
    AVAssetWriterInputPixelBufferAdaptor *adaptor = [AVAssetWriterInputPixelBufferAdaptor
                                                     assetWriterInputPixelBufferAdaptorWithAssetWriterInput:writer
                                                     sourcePixelBufferAttributes:nil];
    
    writer.expectsMediaDataInRealTime = YES;
    
    [videoWriter addInput:writer];
    
    [videoWriter startWriting];
    [videoWriter startSessionAtSourceTime:kCMTimeZero];
    
    UIImage *img = [UIImage imageNamed:@"emmaEmotions.jpg"];
    CVPixelBufferRef imgbuff = [self pixelBufferFromCGImage:img.CGImage size:CGSizeMake(640, 640)];
    
    BOOL status = [adaptor appendPixelBuffer:imgbuff withPresentationTime:CMTimeMake(24, 2)];
    
    if (!status) {
        NSLog(@"Fuck shit\n%@", adaptor);
        abort();
    }
    
    [writer markAsFinished];
    [videoWriter finishWritingWithCompletionHandler:^{
        NSLog(@"Done");
    }];
    NSLog(@"%@", [videoWriter error]);
    CVPixelBufferPoolRelease(adaptor.pixelBufferPool);
    
    return YES;
}

- (CVPixelBufferRef)pixelBufferFromCGImage:(CGImageRef)image size:(CGSize)imageSize
{
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:YES], kCVPixelBufferCGImageCompatibilityKey,
                             [NSNumber numberWithBool:YES], kCVPixelBufferCGBitmapContextCompatibilityKey,
                             nil];
    CVPixelBufferRef pxbuffer = NULL;
    CVReturn status = CVPixelBufferCreate(kCFAllocatorDefault, imageSize.width,
                                          imageSize.height, kCVPixelFormatType_32ARGB, (__bridge CFDictionaryRef) options,
                                          &pxbuffer);
    NSParameterAssert(status == kCVReturnSuccess && pxbuffer != NULL);
    
    CVPixelBufferLockBaseAddress(pxbuffer, 0);
    void *pxdata = CVPixelBufferGetBaseAddress(pxbuffer);
    NSParameterAssert(pxdata != NULL);
    
    CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(pxdata, imageSize.width,
                                                 imageSize.height, 8, 4*imageSize.width, rgbColorSpace,
                                                 kCGImageAlphaNoneSkipFirst);
    NSParameterAssert(context);
    //    CGContextConcatCTM(context, frameTransform);
    CGContextDrawImage(context, CGRectMake(0, 0, CGImageGetWidth(image),
                                           CGImageGetHeight(image)), image);
    CGColorSpaceRelease(rgbColorSpace);
    CGContextRelease(context);
    
    CVPixelBufferUnlockBaseAddress(pxbuffer, 0);
    
    return pxbuffer;
}

- (CVPixelBufferRef)pixelBufferFromCGImage:(CGImageRef)image
{
    
    CGSize frameSize = CGSizeMake(CGImageGetWidth(image), CGImageGetHeight(image));
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:YES], kCVPixelBufferCGImageCompatibilityKey,
                             [NSNumber numberWithBool:YES], kCVPixelBufferCGBitmapContextCompatibilityKey,
                             nil];
    CVPixelBufferRef pxbuffer = NULL;
    CVReturn status = CVPixelBufferCreate(kCFAllocatorDefault, frameSize.width,
                                          frameSize.height,  kCVPixelFormatType_32RGBA, (__bridge CFDictionaryRef) options,
                                          &pxbuffer);

    NSParameterAssert(status == kCVReturnSuccess && pxbuffer != NULL);
    
    CVPixelBufferLockBaseAddress(pxbuffer, 0);
    void *pxdata = CVPixelBufferGetBaseAddress(pxbuffer);
    
    CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(pxdata, frameSize.width,
                                                 frameSize.height, 8, 4*frameSize.width, rgbColorSpace,
                                                 kCGBitmapAlphaInfoMask);
    
    CGContextDrawImage(context, CGRectMake(0, 0, CGImageGetWidth(image),
                                           CGImageGetHeight(image)), image);
    CGColorSpaceRelease(rgbColorSpace);
    CGContextRelease(context);
    
    CVPixelBufferUnlockBaseAddress(pxbuffer, 0);
    
    return pxbuffer;
}

@end
