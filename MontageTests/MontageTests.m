//
//  MontageTests.m
//  MontageTests
//
//  Created by Michael Timbrook on 8/9/13.
//  Copyright (c) 2013 Michael Timbrook. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "PhotoManager.h"
#import "RenderEngine.h"

@interface MontageTests : XCTestCase

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

@end
