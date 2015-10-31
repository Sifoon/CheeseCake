//
//  DetailsViewController.m
//  CheeseCake
//
//  Created by Sifon on 27/10/2015.
//  Copyright (c) 2015 SNasri. All rights reserved.
//

#import "DetailsViewController.h"
#import "STPopup.h"
#import "SingletonClass.h"


@interface DetailsViewController ()
@property(strong,nonatomic) NSDictionary* details;
@end

@implementation DetailsViewController
-(void)viewDidLoad
{
    SingletonClass* sharedSingletonn = [SingletonClass sharedUserProgramCreator];
    _details = [sharedSingletonn userOfProgramCreator];
    

    
    _LabelTitle.text =_details[@"title"];
    _LabelAuthor.text =_details[@"authors"];
    _LabelDate.text =_details[@"date"];
    _TextDescription.text=_details[@"content"];
    
    NSString * ss=_details[@"image"];
    
    if(ss== (id)[NSNull null] || ss.length== 0 )
    {
        
        _image.image = [UIImage imageNamed:@"no-photo.jpg"];
    }
    else
    {

        NSURL *url = [NSURL URLWithString:_details[@"image"]];
        _image.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
    }


}

- (void)awakeFromNib
{
   
  
    
    [super awakeFromNib];
    self.contentSizeInPopup = CGSizeMake([[UIScreen mainScreen] bounds].size.width-75, [[UIScreen mainScreen] bounds].size.height-200);
  //  self.landscapeContentSizeInPopup = CGSizeMake(400, 200);
    
    
}




@end
