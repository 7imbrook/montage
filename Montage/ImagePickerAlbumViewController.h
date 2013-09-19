//
//  ImagePickerAlbumViewController.h
//  Montage
//
//  Created by Michael Timbrook on 8/10/13.
//  Copyright (c) 2013 Michael Timbrook. All rights reserved.
//

static NSString *const ImagePickerAlbumViewControllerSBID = @"imagePick";

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "ImagePickerDelegate.h"

@interface ImagePickerAlbumViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) id<ImagePickerDelegate> delegate;

@end
