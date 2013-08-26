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

@end
