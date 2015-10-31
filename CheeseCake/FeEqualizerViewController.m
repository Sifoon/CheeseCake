//
//  FeEqualizerViewController.m
//  CheeseCake
//
//  Created by Sifon on 27/10/2015.
//  Copyright (c) 2015 SNasri. All rights reserved.
//
#import "FeEqualizerViewController.h"
#import "FeEqualize.h"

@interface FeEqualizerViewController ()
@property (strong, nonatomic) FeEqualize *equalizer;
@end

@implementation FeEqualizerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _equalizer = [[FeEqualize alloc] initWithView:self.view title:@"LOADING"];
    [self.view addSubview:_equalizer];
    
    [_equalizer showWhileExecutingBlock:^{
        [self myTask];
    } completion:^{
        [self.navigationController popToRootViewControllerAnimated:YES];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)myTask
{
    // Do something usefull in here instead of sleeping ...
    sleep(5);
}

@end
