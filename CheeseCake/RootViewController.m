//
//  RootViewController.m
//  CheeseCake
//
//  Created by Sifon on 26/10/2015.
//  Copyright (c) 2015 SNasri. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)awakeFromNib
{
    self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"contentController"];
    self.menuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"menuController"];
}
@end
