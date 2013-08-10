//
//  RootViewController.m
//  Montage
//
//  Created by Piper Chester on 8/9/13.
//  Copyright (c) 2013 Michael Timbrook. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController

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
    [self performSegueWithIdentifier:@"toAbout" sender:self];
}

#pragma mark - Helpers

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
