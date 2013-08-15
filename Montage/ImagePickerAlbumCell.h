//
//  ImagePickerAlbumCell.h
//  Montage
//
//  Created by Michael Timbrook on 8/14/13.
//  Copyright (c) 2013 Michael Timbrook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImagePickerAlbumCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *albumName;
@property (weak, nonatomic) IBOutlet UIImageView *albumImage;

@end
