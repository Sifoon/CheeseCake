//
//  JsonByTitleViewController.m
//  CheeseCake
//
//  Created by Sifon on 27/10/2015.
//  Copyright (c) 2015 SNasri. All rights reserved.
//

#import "JsonByTitleViewController.h"
#import "SingletonClass.h"
#import "DetailsViewController.h"
#import "STPopup.h"

@interface JsonByTitleViewController ()

@property(strong,nonatomic) NSArray *json;

@end

@implementation JsonByTitleViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    SingletonClass* sharedSingletonn = [SingletonClass JsonData];
    NSArray *js=[sharedSingletonn jsonData];
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];

    self.json =[js sortedArrayUsingDescriptors:@[sort]];
    
    
    NSLog(@"json -------------- %@",self.json);
    
    NSLog(@"json -------------- %lu ", (unsigned long)[self.json count]);
    
    _tableView.delegate=self;
    _tableView.dataSource=self;
    
    
    // Do any additional setup after loading the view.
    
    
    
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/**
 Gets the number of rows in a section of a TableView
 @param tableView TableView
 @param section Section
 @returns Number of rows
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.json.count;
}



/**
 Gets the cell of a row in the TableView
 @param tableView TableView
 @param indexPath IndexPath describing the row
 @returns The cell for the row
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell* cell= [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    
    NSDictionary* dict = [self.json objectAtIndex:indexPath.row];
    
    NSLog(@"dict --------------%@",dict);
    
    UILabel *Title = (UILabel *)[cell viewWithTag:110];
    Title.text =dict[@"title"];
    
    UILabel *Author = (UILabel *)[cell viewWithTag:120];
    Author.text =dict[@"authors"];
    
    UILabel *Date = (UILabel *)[cell viewWithTag:130];
    Date.text =dict[@"date"];
    
    
    
    
    
    
    
    
    NSString * ss=dict[@"image"];
    
    if(ss== (id)[NSNull null] || ss.length== 0 )
    {
        UIImageView *Imagee=(UIImageView *)[cell viewWithTag:100];
        
        Imagee.image = [UIImage imageNamed:@"no-photo.jpg"];
    }
    else
    {
        NSURL *url = [NSURL URLWithString:dict[@"image"]];
        NSLog(@"%@---------------",url);
        
        
        UIImageView *Imagee=(UIImageView *)[cell viewWithTag:100];
        
        Imagee.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
    }
    
    
       cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
     [self showPopupWithTransitionStyle:STPopupTransitionStyleSlideVertical rootViewController:[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"DetailsViewController"]];
    
       
    NSDictionary *dict= [self.json objectAtIndex:indexPath.row];
    SingletonClass* sharedUserCreator = [SingletonClass sharedUserProgramCreator];
    [sharedUserCreator setUserOfProgramCreator:dict];

    
    
       NSString * storyboardName = @"Main";
      UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
      UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];
       [self presentViewController:vc animated:YES completion:nil];
    
    
    
      //[self.navigationController pushViewController:detailViewController animated:NO];
    
     [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSLog(@"flkznsfmljnadsjnazdùnazkdazdknadznazssssssssss");
}

- (void)showPopupWithTransitionStyle:(STPopupTransitionStyle)transitionStyle rootViewController:(UIViewController *)rootViewController
{
    STPopupController *popupController = [[STPopupController alloc] initWithRootViewController:rootViewController];
    popupController.cornerRadius = 4;
    popupController.transitionStyle = transitionStyle;
    [popupController presentInViewController:self];
}


@end
