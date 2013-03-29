//
//  MineViewController.m
//  Travel
//
//  Created by apple on 13-3-26.
//  Copyright (c) 2013年 com.jdtx. All rights reserved.
//

#import "MineViewController.h"
#import "IIViewDeckController.h"

@interface MineViewController ()

@end

@implementation MineViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
