//
//  JsonByTitleViewController.h
//  CheeseCake
//
//  Created by Sifon on 27/10/2015.
//  Copyright (c) 2015 SNasri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JsonByTitleViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>


@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
