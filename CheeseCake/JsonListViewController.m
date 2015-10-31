//
//  JsonListViewController.m
//  CheeseCake
//
//  Created by Sifon on 26/10/2015.
//  Copyright (c) 2015 SNasri. All rights reserved.
//

#import "JsonListViewController.h"
#import "SingletonClass.h"
#import "DetailsViewController.h"
#import "STPopup.h"


@interface JsonListViewController () <UITableViewDataSource, UITableViewDelegate>
@property(strong,nonatomic) NSArray *json;
@end

@implementation JsonListViewController

- (void)viewDidLoad {
    
    SingletonClass* sharedSingletonn = [SingletonClass JsonData];
    self.json = [sharedSingletonn jsonData];
    NSLog(@"json -------------- %@",self.json);

    NSLog(@"json -------------- %lu ", (unsigned long)[self.json count]);

    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
  
    
    
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    

   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
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
    
    
    
    
    
    
    
    
    
    
    //Imagee = [[UIImage alloc] initWithData:data cache:NO];
    // CGSize size = img.size;
    
    // cell.imageview.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[dict objectForKey:@"Image"]]];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}




/**
 Handles when a row is selected in the TableView
 @param tableView TableView
 @param indexPath IndexPath for selected row
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
  // [self showPopupWithTransitionStyle:STPopupTransitionStyleSlideVertical rootViewController:[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"DetailsViewController"]];
    
//    CGRect cellFrameInTableView = [tableView rectForRowAtIndexPath:indexPath];
//    CGRect cellFrameInSuperview = [tableView convertRect:cellFrameInTableView toView:[tableView superview]];
    
  //  DetailsViewController* detailViewController = [[DetailsViewController alloc] init];
    
   // NSDictionary* dict = [self.json objectAtIndex:indexPath.row];
  //  NSLog(@"%@",dict);
 //   detailViewController.yOrigin = cellFrameInSuperview.origin.y;
    
    
    
    
//    SingletonClass* sharedUserCreator = [SingletonClass sharedUserProgramCreator];
//    [sharedUserCreator setUserOfProgramCreator:dict];
    
    
    
    
    
 //   NSString * storyboardName = @"Main";
  //  UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
  //  UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];
 //   [self presentViewController:vc animated:YES completion:nil];
    
    
    
  //  //[self.navigationController pushViewController:detailViewController animated:NO];
    
   // [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSLog(@"flkznsfmljnadsjnazdùnazkdazdknadznazssssssssss");
}

//- (void)showPopupWithTransitionStyle:(STPopupTransitionStyle)transitionStyle rootViewController:(UIViewController *)rootViewController
//{
//    STPopupController *popupController = [[STPopupController alloc] initWithRootViewController:rootViewController];
//    popupController.cornerRadius = 4;
//    popupController.transitionStyle = transitionStyle;
//    [popupController presentInViewController:self];
//}

@end
