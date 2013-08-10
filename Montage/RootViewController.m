//
//  RootViewController.m
//  Montage
//
//  Created by Piper Chester on 8/9/13.
//  Copyright (c) 2013 Michael Timbrook. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
    [doubleTap setNumberOfTapsRequired:2];
    [self.view addGestureRecognizer:doubleTap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)handleDoubleTap:(UITapGestureRecognizer *)gesture
{
    [self performSegueWithIdentifier:@"toAbout" sender:self];
}

@end
