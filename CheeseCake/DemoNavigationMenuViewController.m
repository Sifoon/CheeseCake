//
//  DemoNavigationMenuViewController.m
//  CheeseCake
//
//  Created by Sifon on 26/10/2015.
//  Copyright (c) 2015 SNasri. All rights reserved.
//

#import "DemoNavigationMenuViewController.h"

@interface DemoNavigationMenuViewController ()

@end

@implementation DemoNavigationMenuViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognized:)]];
}

#pragma mark -
#pragma mark Gesture recognizer

- (void)panGestureRecognized:(UIPanGestureRecognizer *)sender
{
    // Dismiss keyboard (optional)
    //
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    
    // Present the view controller
    //
    [self.frostedViewController panGestureRecognized:sender];
}

@end
