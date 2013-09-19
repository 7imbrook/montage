//
//  ImagePickerDelegate.h
//  Montage
//
//  Created by Michael Timbrook on 9/19/13.
//  Copyright (c) 2013 Michael Timbrook. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ImagePickerDelegate <NSObject>

- (void)didFinishPickingImagesWithArray:(NSArray *)images;

@end
