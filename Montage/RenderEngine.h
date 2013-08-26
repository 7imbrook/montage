//
//  RenderEngine.h
//  Montage
//
//  Created by Michael Timbrook on 8/25/13.
//  Copyright (c) 2013 Michael Timbrook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhotoManager.h"

@interface RenderEngine : NSObject

/**
 * Creates a new renderer with an attached photomanager
 * @param manager PhotoManager object to render out
 */
+ (instancetype)rendererWithPhotoManager:(PhotoManager *)manager;

@end
