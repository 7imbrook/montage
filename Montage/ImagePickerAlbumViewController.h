//
//  ImagePickerAlbumViewController.h
//  Montage
//
//  Created by Michael Timbrook on 8/10/13.
//  Copyright (c) 2013 Michael Timbrook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface ImagePickerAlbumViewController : UIViewController <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
