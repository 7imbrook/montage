//
//  PhotoManager.h
//  Montage
//
//  Created by Michael Timbrook on 8/9/13.
//  Copyright (c) 2013 Michael Timbrook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoManager : NSObject <UICollectionViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@protocol PhotoManagerDelegate <NSObject>

- (void)photoManagerAddPhoto:(UITapGestureRecognizer *)reg;

@end