//
//  PhotoManager.m
//  Montage
//
//  Created by Michael Timbrook on 8/9/13.
//  Copyright (c) 2013 Michael Timbrook. All rights reserved.
//

#import "PhotoManager.h"

@implementation PhotoManager

#pragma mark - UICollectionViewDatasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AddPhoto" forIndexPath:indexPath];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:collectionView.delegate action:@selector(photoManagerAddPhoto:)];
    [cell addGestureRecognizer:tap];
    return cell;
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"%@", info);
}

@end
