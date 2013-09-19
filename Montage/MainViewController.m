//
//  ViewController.m
//  Montage
//
//  Created by Michael Timbrook on 8/9/13.
//  Copyright (c) 2013 Michael Timbrook. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _photoManager = [PhotoManager new];
    _imageCollection.dataSource = _photoManager;
    _imageCollection.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDelegate

#pragma mark - PhotoManagerDelegate

#pragma mark - ImagePickerDelegate

- (void)didFinishPickingImagesWithArray:(NSArray *)images
{
    NSLog(@"%@", images);
}

@end
