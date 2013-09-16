//
//  ImagePickerViewController.m
//  Montage
//
//  Created by Michael Timbrook on 8/9/13.
//  Copyright (c) 2013 Michael Timbrook. All rights reserved.
//

#import "ImagePickerViewController.h"
#import "ImagePickerImageCell.h"
#import "AppDelegate.h"

@implementation ImagePickerViewController
{
    NSMutableArray *_assets;
    ALAssetsLibrary *_library;
}

- (void)viewDidLoad
{
    _images.dataSource = self;
    _images.delegate = self;
    _images.allowsMultipleSelection = YES;
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
    _assets = [_assets.reverseObjectEnumerator.allObjects mutableCopy];
}

- (IBAction)backButton:(id)sender
{
    AppDelegate *app = [[UIApplication sharedApplication] delegate];
    [app popViewControllerOnCenter];
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImagePickerImageCell *cell = (ImagePickerImageCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell setAlpha:0.2];    
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImagePickerImageCell *cell = (ImagePickerImageCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell setAlpha:1.0];
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
