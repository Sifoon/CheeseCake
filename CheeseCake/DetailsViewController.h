//
//  DetailsViewController.h
//  CheeseCake
//
//  Created by Sifon on 27/10/2015.
//  Copyright (c) 2015 SNasri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *LabelTitle;
@property (strong, nonatomic) IBOutlet UILabel *LabelAuthor;
@property (strong, nonatomic) IBOutlet UILabel *LabelDate;
@property (strong, nonatomic) IBOutlet UITextView *TextDescription;

@end
