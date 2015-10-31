//
//  ViewController.m
//  CheeseCake
//
//  Created by Sifon on 26/10/2015.
//  Copyright (c) 2015 SNasri. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "MenuTableViewController.h"
#import "RootViewController.h"
#import "SingletonClass.h"
#import "Reachability.h"
#import "SCLAlertView.h"

@interface ViewController () <FBSDKLoginButtonDelegate>
@property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginButton;
@property (weak, nonatomic) IBOutlet id<FBSDKLoginButtonDelegate> delegate;

@end

@implementation ViewController
{
    Reachability *internetReachableFoo;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _RetryButton.hidden=YES;
    [self testInternetConnection];
          
   

}
-(void)profileUpdated:(NSNotification *) notification{
    NSLog(@"User name: %@",[FBSDKProfile currentProfile].name);
    NSLog(@"User ID: %@",[FBSDKProfile currentProfile].userID);
    
//    MenuTableViewController *viewController = [[MenuTableViewController alloc] initWithNibName:@"MenuTableViewController" bundle:nil];
//    viewController.userName=[FBSDKProfile currentProfile].name;
//    viewController.userID=[FBSDKProfile currentProfile].userID;
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]initWithCapacity:2];
    [dict setObject:[NSString stringWithString:[FBSDKProfile currentProfile].name] forKey:@"userName"];
    [dict setObject:[NSString stringWithString:[FBSDKProfile currentProfile].userID] forKey:@"userID"];
    
    
    SingletonClass* sharedUserCreator = [SingletonClass sharedUserProgramCreator];
    [sharedUserCreator setUserOfProgramCreator:dict];

    
    
    NSString * storyboardName = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"rootController"];
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




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testInternetConnection
{
    internetReachableFoo = [Reachability reachabilityWithHostname:@"www.google.com"];
    
    // Internet is reachable
    internetReachableFoo.reachableBlock = ^(Reachability*reach)
    {
        // Update the UI on the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"There IS internet connection");
            _RetryButton.hidden=YES;

            if ([FBSDKAccessToken currentAccessToken])
            {
                // post to wall
                NSLog(@"Seifffff: ");
                NSLog(@"User name: %@",[FBSDKProfile currentProfile].name);
                NSLog(@"User ID: %@",[FBSDKProfile currentProfile].userID);
                NSMutableDictionary *dict = [[NSMutableDictionary alloc]initWithCapacity:2];
                [dict setObject:[NSString stringWithString:[FBSDKProfile currentProfile].name] forKey:@"userName"];
                [dict setObject:[NSString stringWithString:[FBSDKProfile currentProfile].userID] forKey:@"userID"];
                
                
                SingletonClass* sharedUserCreator = [SingletonClass sharedUserProgramCreator];
                [sharedUserCreator setUserOfProgramCreator:dict];
                
                
                
                NSString * storyboardName = @"Main";
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
                UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"FeSpinnerTenDotViewController"];
                [self presentViewController:vc animated:YES completion:nil];
                
            }
            else{
                
                FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
                loginButton.frame = CGRectMake(self.view.frame.size.width/2 - loginButton.frame.size.width/2, self.view.frame.size.height/2 - loginButton.frame.size.height/2, loginButton.frame.size.width, loginButton.frame.size.height);
                
                [self.view addSubview:loginButton];
                
                self.loginButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
                self.loginButton.delegate = self;
                [FBSDKProfile enableUpdatesOnAccessTokenChange:YES];
                [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(profileUpdated:) name:FBSDKProfileDidChangeNotification object:nil];
                
                
                
            }

            
        });
    };
    
    // Internet is not reachable
    internetReachableFoo.unreachableBlock = ^(Reachability*reach)
    {
        // Update the UI on the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
         
            SCLAlertView *alert = [[SCLAlertView alloc] init];
            
            [alert showError:self title:@"Reachability" subTitle:@"No internet connection" closeButtonTitle:@"Close & Retry" duration:7.0];

            
          //  [alert showNotice:self title:@"Internet connection" subTitle:@"You need to connect to the internet for loging in" closeButtonTitle:nil duration:2.0f];
            
            _RetryButton.hidden = NO;

        });

        

    };

    
    
    
    [internetReachableFoo startNotifier];
}


- (IBAction)RetryButtonPressed:(id)sender {
    [self testInternetConnection];

}
@end
