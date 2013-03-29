//
//  ChoiceCityViewController.m
//  Travel
//
//  Created by apple on 13-3-25.
//  Copyright (c) 2013年 com.jdtx. All rights reserved.
//

#import "ChoiceCityViewController.h"
#import "IIViewDeckController.h"

@interface ChoiceCityViewController ()
@property bool hasLeftViewController,hasRightViewController;
@end

@implementation ChoiceCityViewController

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
    
    if (self.viewDeckController.leftController!=nil) {
        self.hasLeftViewController = YES;
        [self.viewDeckController performSelector:@selector(setLeftController:) withObject:nil afterDelay:0.3];
    }
    if (self.viewDeckController.rightController!=nil) {
        self.hasRightViewController = YES;
        [self.viewDeckController performSelector:@selector(setRightController:) withObject:nil afterDelay:0.3];
    }
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
    
    NSString *path=[[NSBundle mainBundle] pathForResource:@"citydict"
                                                   ofType:@"plist"];
    self.cities = [[NSDictionary alloc]
                   initWithContentsOfFile:path];
    
    self.keys = [[_cities allKeys] sortedArrayUsingSelector:
                 @selector(compare:)];
    self.tableViewOfCity.dataSource = self;
    self.tableViewOfCity.delegate = self;
}

-(void)back{
    if (self.hasLeftViewController) {
        self.viewDeckController.leftController = SharedAppDelegate.leftController;
    }
    if (self.hasRightViewController) {
        self.viewDeckController.rightController = SharedAppDelegate.rightController;
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidUnload {
    [self setTableViewOfCity:nil];
    [super viewDidUnload];
}

#pragma mark UITableViewDataSource required method
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //mode1
    //    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"AttractionCell"
    //                                                    owner:self options:nil];
    //    AttractionCell *cell = (AttractionCell *)[bundle objectAtIndex:0];
    
    //mode2
    static NSString *cellName = @"ChoicCityCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    cell.textLabel.text = @"123";
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.keys count];
}

#pragma mark UITableViewDataSource option method
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.keys count];
}

//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
//
//}
//
//- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
//
//}
//
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [self.keys objectAtIndex:section];
}

//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
//
//}

#pragma mark UITableViewDelegate option method
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
@end
