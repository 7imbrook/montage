//
//  AboutViewController.m
//  Montage
//
//  Created by Piper Chester on 8/9/13.
//  Copyright (c) 2013 Michael Timbrook. All rights reserved.
//

#import "AboutViewController.h"

@implementation AboutViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
    [doubleTap setNumberOfTapsRequired:2];
    [self.view addGestureRecognizer:doubleTap];
}

#pragma mark - Gesture Handling

- (void)handleDoubleTap:(UITapGestureRecognizer *)gesture
{
    [self dismissViewControllerAnimated:YES completion:^(void){}];
}

#pragma mark - Helpers

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
