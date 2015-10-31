//
//  JsonByAuthorsViewController.m
//  CheeseCake
//
//  Created by Sifon on 27/10/2015.
//  Copyright (c) 2015 SNasri. All rights reserved.
//

#import "JsonByAuthorsViewController.h"
#import "HYAwesomeTransition.h"
#import "ModalViewController.h"
#import "SingletonClass.h"

@interface JsonByAuthorsViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UIViewControllerTransitioningDelegate,ModalViewControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, strong)HYAwesomeTransition *awesometransition;
@property (nonatomic, weak) UIView *transitionCell;
@property(nonatomic,strong) NSArray *json;
@end

@implementation JsonByAuthorsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.awesometransition = [[HYAwesomeTransition alloc] init];
    self.awesometransition.duration = 2.0f;
    
    
    
    
    SingletonClass* sharedSingletonn = [SingletonClass JsonData];
    NSArray *js=[sharedSingletonn jsonData];
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"authors" ascending:YES];
    
    self.json =[js sortedArrayUsingDescriptors:@[sort]];
    
    
    NSLog(@"json -------------- dsds%@",self.json);
    
    NSLog(@"json -------------- %lu ", (unsigned long)[self.json count]);
    
   
    _collectionView.delegate=self;
    _collectionView.dataSource=self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - collectionView
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ReuseIdentifier = @"CustomMainCell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ReuseIdentifier forIndexPath:indexPath];
    
    
    NSDictionary* dict = [self.json objectAtIndex:indexPath.row];

    
    NSString *ss=dict[@"image"];
    
    if(ss== (id)[NSNull null] || ss.length== 0 )
    {
        UIImageView *Imagee=(UIImageView *)[cell viewWithTag:99];
        
        Imagee.image = [UIImage imageNamed:@"no-photo.jpg"];
    }
    else
    {
        NSURL *url = [NSURL URLWithString:dict[@"image"]];
        NSLog(@"%@---------------",url);
        
        
        UIImageView *Imagee=(UIImageView *)[cell viewWithTag:99];
        
        Imagee.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
    }

    UILabel *Author = (UILabel *)[cell viewWithTag:100];
    Author.text =dict[@"authors"];
 
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.json.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    
  

    
    ModalViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ModalViewController"];
    [vc loadView];
    vc.transitioningDelegate = self;
    vc.delegate              = self;
    vc.avatar.hidden         = YES;
    
    NSDictionary *dict= [self.json objectAtIndex:indexPath.row];
    SingletonClass* shared= [SingletonClass DetailsByAuthors];
    [shared setDetails:dict];
    // NSLog(@"sifone le patron%@",dict);
    
    CGRect startFrame = [cell convertRect:cell.bounds toView:self.view];
    CGRect finalFrame = vc.avatar.frame;
    
    [self.awesometransition registerStartFrame:startFrame
                                    finalFrame:finalFrame transitionView:cell];
    
    cell.hidden = YES;
    self.transitionCell = cell;
    
    __weak ModalViewController *weakVC = vc;
    [self presentViewController:vc animated:YES completion:^{
        weakVC.avatar.hidden = NO;
    }];
}

#pragma mark - ModelViewController delegate

- (void)modalViewControllerDidClickedDismissButton:(ModalViewController *)viewController{
    [self dismissViewControllerAnimated:YES completion:^{
        self.transitionCell.hidden = NO;
    }];
}

#pragma mark - transition
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    self.awesometransition.present = YES;
    return self.awesometransition;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    self.awesometransition.present = NO;
    return self.awesometransition;
}


@end


