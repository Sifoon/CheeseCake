//
//  ModalViewController.m
//  CheeseCake
//
//  Created by Sifon on 27/10/2015.
//  Copyright (c) 2015 SNasri. All rights reserved.
//

#import "ModalViewController.h"
#import "SingletonClass.h"

@interface ModalViewController ()
@property(nonatomic,strong) NSDictionary * details;
@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) viewDidAppear:(BOOL)animated
{
    
    // Do any additional setup after loading the view.
    SingletonClass* sharedSingletonn = [SingletonClass DetailsByAuthors];
    _details = [sharedSingletonn details];
    
    
    NSLog(@"sifon le patron%@",_details);
    NSLog(@"sifon le patron");
    
    _LabelTitle.text =_details[@"title"];
    _labelAuthor.text =_details[@"authors"];
    _LabelDate.text =_details[@"date"];
    _TextContent.text=_details[@"content"];
    
    NSString * ss=_details[@"image"];
    
    
    
    
    if(ss== (id)[NSNull null] || ss.length== 0 )
    {
        
        _avatar.image = [UIImage imageNamed:@"no-photo.jpg"];
    }
    else
    {
        
        NSURL *url = [NSURL URLWithString:_details[@"image"]];
        _avatar.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
    }

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)BackButtonClicked:(id)sender {
    
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(modalViewControllerDidClickedDismissButton:)]) {
        [self.delegate modalViewControllerDidClickedDismissButton:self];
    }
    
}

@end
