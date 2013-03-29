//
//  IndexViewController.h
//  Travel
//
//  Created by apple on 13-3-21.
//  Copyright (c) 2013年 com.jdtx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AttractionTableView.h"

@interface IndexViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIBarButtonItem *leftBtn;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *rightBtn;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segement;
@property (strong, nonatomic) IBOutlet UIScrollView *container;

@property (nonatomic,retain) AttractionTableView *hotAttractionTableView;
@property (nonatomic,retain) AttractionTableView *recommendAttractionTableView;
@end
