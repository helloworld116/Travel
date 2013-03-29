//
//  IndexViewController.m
//  Travel
//
//  Created by apple on 13-3-21.
//  Copyright (c) 2013年 com.jdtx. All rights reserved.
//

#import "IndexViewController.h"
#import "IIViewDeckController.h"

@interface IndexViewController ()

@end

@implementation IndexViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    leftMenu;
    rightMenu;
    self.viewDeckController.leftSize = 230;
    self.viewDeckController.rightSize = 230;
    self.container.contentSize = CGSizeMake(self.container.frame.size.width*3, self.container.frame.size.height);
    [self.segement addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    
}

-(void)leftBtnHandle:(id)sender{
    NSLog(@"left is %@",sender);
}

-(void)rightBtnHandle:(id)sender{
    NSLog(@"right is %@",sender);
}

-(void) showInScreen:(NSInteger) index {
//    //1显示状态
//    [SVProgressHUD showWithStatus:@"正在载入..."];
//    //2从系统中获取一个并行队列
//    dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    //3在后台线程创建图像选择器
//    dispatch_async(concurrentQueue, ^{
//        kUrlOfSightList 
//        NSDictionary* data = [NSDictionary dictionaryWithContentsOfJSONURLString:];
//        //4让主线程显示图像选择器
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [SVProgressHUD dismiss];
//        });
//    }); 
    CGRect rect = self.container.bounds;
    switch (index) {
        case 0:
            if (self.hotAttractionTableView==nil) {
                rect.origin.x = self.container.frame.size.width*0;
                self.container.contentOffset = CGPointMake(self.container.frame.size.width*0, 0);
            }
            break;
        case 1:
            if (self.recommendAttractionTableView==nil) {
                rect.origin.x = self.container.frame.size.width;
            }
            break;
        case 2:
            break;
    }
    
}

-(void) segmentedControlChangedValue:(id)sender{
    int selectIndex = [sender selectedSegmentIndex];
    self.container.contentOffset = CGPointMake(self.view.frame.size.width*selectIndex, 0);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setLeftBtn:nil];
    [self setRightBtn:nil];
    [self setSegement:nil];
    [self setContainer:nil];
    [super viewDidUnload];
}
@end
