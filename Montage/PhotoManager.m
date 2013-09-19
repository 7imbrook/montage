//
//  PhotoManager.m
//  Montage
//
//  Created by Michael Timbrook on 8/9/13.
//  Copyright (c) 2013 Michael Timbrook. All rights reserved.
//

#import "PhotoManager.h"
#import <AssetsLibrary/AssetsLibrary.h>

@implementation PhotoManager
{
    UICollectionView *_drivingCollectionView;
    dispatch_once_t _onceToken;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _photos = [NSMutableOrderedSet new];
    }
    return self;
}

- (void)addPhotos:(NSSet *)assets
{
    [_photos addObjectsFromArray:assets.allObjects];
    [_drivingCollectionView reloadData];
}

- (BOOL)containsPhotos
{
    return _photos.count > 0;
}

#pragma mark - UICollectionViewDatasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    dispatch_once(&_onceToken, ^{
        _drivingCollectionView = collectionView;
    });
    if (self.containsPhotos) {
        return _photos.count;
    } else {
        return 1;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"photoCell" forIndexPath:indexPath];
    UIImage *photo;
    if (self.containsPhotos) {
        ALAsset *asset = [_photos objectAtIndex:indexPath.row];
        photo = [UIImage imageWithCGImage:asset.thumbnail];
    } else {
        photo = [UIImage imageNamed:@"plus.jpg"];
    }
    [cell.backgroundImageView setImage:photo];
    return cell;
}

@end
