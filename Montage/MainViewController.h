//
//  ViewController.h
//  Montage
//
//  Created by Michael Timbrook on 8/9/13.
//  Copyright (c) 2013 Michael Timbrook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoManager.h"

@interface MainViewController : UIViewController <UICollectionViewDelegate, PhotoManagerDelegate>

@property (weak, nonatomic) IBOutlet UIView *stage;
@property (weak, nonatomic) IBOutlet UICollectionView *imageCollection;

@property (strong, nonatomic) PhotoManager *photoManager;

@end
