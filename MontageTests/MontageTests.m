//
//  MontageTests.m
//  MontageTests
//
//  Created by Michael Timbrook on 8/9/13.
//  Copyright (c) 2013 Michael Timbrook. All rights reserved.
//

#import <XCTest/XCTest.h>
@import CoreImage;

#import "PhotoManager.h"
#import "RenderEngine.h"

@interface MontageTests : XCTestCase

@end

@interface RenderEngine ()

- (CVPixelBufferRef)pixelBufferFromCGImage:(CGImageRef)image size:(CGSize)imageSize;
- (CVPixelBufferRef)pixelBufferFromCGImage:(CGImageRef)image;

@end

@implementation MontageTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testRender
{
    PhotoManager *photoManager = [PhotoManager new];
    RenderEngine *render = [RenderEngine rendererWithPhotoManager:photoManager];
    
    [render start];
    
}

- (void)testPixelBuffer
{
    
    UIImage *testImage = [UIImage imageWithContentsOfFile:@"/Users/michael/Projects/Montage/MontageTests/emmaEmotions.jpg"];
    CGImageRef img = testImage.CGImage;
    
    RenderEngine *test = [RenderEngine new];
    CVPixelBufferRef buff = [test pixelBufferFromCGImage:img];
    
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:YES], kCVPixelBufferCGImageCompatibilityKey,
                             [NSNumber numberWithBool:NO], kCVPixelBufferCGBitmapContextCompatibilityKey,
                             nil];
    
    CIImage *imageTest = [CIImage imageWithCVPixelBuffer:buff options:options];
    NSLog(@"%@", imageTest);
    
}

@end
