//
//  ModalViewController.h
//  CheeseCake
//
//  Created by Sifon on 27/10/2015.
//  Copyright (c) 2015 SNasri. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ModalViewController;
@protocol ModalViewControllerDelegate <NSObject>
-(void) modalViewControllerDidClickedDismissButton:(ModalViewController *)viewController;
@end

@interface ModalViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (nonatomic, weak) id<ModalViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UILabel *LabelTitle;
@property (strong, nonatomic) IBOutlet UILabel *labelAuthor;
@property (strong, nonatomic) IBOutlet UILabel *LabelDate;
@property (strong, nonatomic) IBOutlet UITextView *TextContent;

@end
