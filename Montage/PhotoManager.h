//
//  PhotoManager.h
//  Montage
//
//  Created by Michael Timbrook on 8/9/13.
//  Copyright (c) 2013 Michael Timbrook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhotoCell.h"

@interface PhotoManager : NSObject <UICollectionViewDataSource>

@property (nonatomic) NSMutableOrderedSet *photos;

/**
 * Use this method to add photos to a photo
 */
- (void)addPhotos:(NSSet *)assets;

/**
 * Check if photo manager has photos in it.
 */
- (BOOL)containsPhotos;

@end

@protocol PhotoManagerDelegate <NSObject>

@end
