//
//  LogOutViewController.m
//  CheeseCake
//
//  Created by Sifon on 27/10/2015.
//  Copyright (c) 2015 SNasri. All rights reserved.
//

#import "LogOutViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface LogOutViewController ()  <FBSDKLoginButtonDelegate >

@property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginButton;
@property (weak, nonatomic) IBOutlet id<FBSDKLoginButtonDelegate> delegate;
@end

@implementation LogOutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.frame = CGRectMake(self.view.frame.size.width/2 - loginButton.frame.size.width/2, self.view.frame.size.height/2 - loginButton.frame.size.height/2, loginButton.frame.size.width, loginButton.frame.size.height);
    
    [self.view addSubview:loginButton];
    self.loginButton.delegate = self;
    [FBSDKProfile enableUpdatesOnAccessTokenChange:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(profileUpdated:) name:FBSDKProfileDidChangeNotification object:nil];
    

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)profileUpdated:(NSNotification *) notification{
    
    NSString * storyboardName = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    [self presentViewController:vc animated:YES completion:nil];
    
    
    
}

- (void)  loginButton:(FBSDKLoginButton *)loginButton
didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
                error:(NSError *)error{
    NSLog(@"Seifffff: ");
    
    
    
}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton{
    NSLog(@"Seifffff: ");
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
