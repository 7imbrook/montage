//
//  ImagePickerViewController.h
//  Montage
//
//  Created by Michael Timbrook on 8/9/13.
//  Copyright (c) 2013 Michael Timbrook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

static NSString *const ImagePickerViewControllerSBID = @"ImagePickerVC";

@interface ImagePickerViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *images;

- (void)loadCollectionWithAlbum:(ALAssetsGroup *)album fromLibrary:(ALAssetsLibrary *)lib;
- (IBAction)backButton:(id)sender;

@end
