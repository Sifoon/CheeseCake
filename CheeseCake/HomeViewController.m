//
//  HomeViewController.m
//  CheeseCake
//
//  Created by Sifon on 26/10/2015.
//  Copyright (c) 2015 SNasri. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController



- (IBAction)MenuButtonClicked:(id)sender {
    // Dismiss keyboard (optional)
    
    //
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    
    // Present the view controller
    //
    [self.frostedViewController presentMenuViewController];
    NSLog(@"sssssssss");

}
@end
