//
//  ImagePickerViewController.m
//  Montage
//
//  Created by Michael Timbrook on 8/9/13.
//  Copyright (c) 2013 Michael Timbrook. All rights reserved.
//

#import "ImagePickerViewController.h"
#import "ImagePickerImageCell.h"

@implementation ImagePickerViewController
{
    NSMutableArray *_assets;
    __strong ALAssetsLibrary *_library;
}

- (void)viewDidLoad
{
    _images.dataSource = self;
}

- (void)loadCollectionWithAlbum:(ALAssetsGroup *)album fromLibrary:(ALAssetsLibrary *)lib
{
    _library = lib;
    _assets = [NSMutableArray new];
    
    // Setup assets library for getting images
    
    void (^assetEnumerator)(ALAsset *, NSUInteger, BOOL *) = ^(ALAsset *result, NSUInteger index, BOOL *stop) {
        if (result == nil)
            return;
        [_assets addObject:result];
    };

    [album enumerateAssetsUsingBlock:assetEnumerator];
}

- (IBAction)backButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UICollectionViewDatasorce

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _assets.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    ImagePickerImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"photoCell" forIndexPath:indexPath];
    
    ALAsset *img = [_assets objectAtIndex:indexPath.row];
    [cell.bgImage setImage:[UIImage imageWithCGImage:img.thumbnail]];
    
    return cell;
}

@end
