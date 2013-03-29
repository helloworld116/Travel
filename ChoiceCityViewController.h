//
//  ChoiceCityViewController.h
//  Travel
//
//  Created by apple on 13-3-25.
//  Copyright (c) 2013年 com.jdtx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChoiceCityViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, retain) NSDictionary *cities;
@property (nonatomic, retain) NSArray *keys;
@property (strong, nonatomic) IBOutlet UITableView *tableViewOfCity;

@end
