//
//  ListViewController.h
//  Travel
//
//  Created by apple on 13-3-26.
//  Copyright (c) 2013年 com.jdtx. All rights reserved.
//

#import "ListTableView.h"

@interface ListViewController : UIViewController 
@property (strong, nonatomic) IBOutlet UIScrollView *container;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segment;

@end
