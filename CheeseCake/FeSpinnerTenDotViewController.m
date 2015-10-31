//
//  FeSpinnerTenDotViewController.m
//  CheeseCake
//
//  Created by Sifon on 27/10/2015.
//  Copyright (c) 2015 SNasri. All rights reserved.
//

#import "FeSpinnerTenDotViewController.h"
#import "FeSpinnerTenDot.h"
#import "UIColor+flat.h"
#import "SingletonClass.h"

@interface FeSpinnerTenDotViewController () <FeSpinnerTenDotDelegate>
{
    NSInteger index;
}
@property (strong, nonatomic) FeSpinnerTenDot *spinner;
@property (strong, nonatomic) NSArray *arrTitile;
@property (strong, nonatomic) NSTimer *timer;

- (IBAction)start:(id)sender;
- (IBAction)dismiss:(id)sender;
-(void) changeTitle;
-(void) longTask;


@property (nonatomic, strong) NSArray* json;
@property (nonatomic, strong) NSMutableData *imageData;
@property (nonatomic, strong) NSMutableArray *MutableJson;



@end

@implementation FeSpinnerTenDotViewController

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
    
    self.view.backgroundColor = [UIColor colorWithHexCode:@"#019875"];
    
    //*********
    index = 0;
    _arrTitile = @[@"LOADING",@"PLZ WAITING",@"CALM DOWN",@"SUCCESSFUL"];
    
    // init Loader
    _spinner = [[FeSpinnerTenDot alloc] initWithView:self.view withBlur:NO];
    _spinner.titleLabelText = _arrTitile[index];
    _spinner.fontTitleLabel = [UIFont fontWithName:@"Neou-Thin" size:36];
    _spinner.delegate = self;
    
    [self.view addSubview:_spinner];
    
    
  
    
  
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self start:self];
    
    //[self performSelector:@selector(dismiss:) withObject:nil afterDelay:7.0f];
}
- (IBAction)start:(id)sender
{
    if (!_timer)
    {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeTitle) userInfo:nil repeats:YES];
    }
    
    [_spinner showWhileExecutingSelector:@selector(longTask) onTarget:self withObject:nil completion:^{
        [_timer invalidate];
        _timer = nil;
        
        index = 0;
        
        [self.navigationController popToRootViewControllerAnimated:YES];
    }];
}
-(void) longTask
{
    NSURL *url=[NSURL URLWithString: @"http://www.ckl.io/challenge/"];
   // NSData* data = [NSData dataWithContentsOfURL:url];
    
  //  NSLog(@"%@",data);
    
    NSError* error = nil;
    NSData* data = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:&error];
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
    }
    else {
        NSLog(@"Data has loaded successfully.");
        //parse out the json data
        NSError* error;
        self.json = [NSJSONSerialization
                     JSONObjectWithData:data //1
                     
                     options:kNilOptions
                     error:&error];
        
        NSLog(@"%@ permutation111111",self.json);
         sleep(3);
        
          
    
        
        SingletonClass* sharedUserCreator = [SingletonClass JsonData];
        [sharedUserCreator setJsonData:self.json];
        
        NSString * storyboardName = @"Main";
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
        UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"rootController"];
        [self presentViewController:vc animated:YES completion:nil];

    }
    // Do a long take
   
}
- (IBAction)dismiss:(id)sender
{
    [_timer invalidate];
    [_spinner dismiss];
    
    // pop
    [self.navigationController popViewControllerAnimated:YES];
}
-(void) changeTitle
{
    NSLog(@"index = %d",index);
    
    if (index == _arrTitile.count)
    {
        index=0;
        _spinner.titleLabelText = _arrTitile[index];

    }
    else
    
    _spinner.titleLabelText = _arrTitile[index];
    index++;
}
-(void) FeSpinnerTenDotDidDismiss:(FeSpinnerTenDot *)sender
{
    NSLog(@"did dismiss");
}

- (void)fetchedData:(NSData *)responseData {
   
    
    
    
    
    
    /**
     
     
     
     **/
    
    
}


@end