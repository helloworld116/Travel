//
//  LeftViewController.m
//  ViewDeckExample
//


#import "LeftViewController.h"
#import "IIViewDeckController.h"
#import "ChoiceCityViewController.h"

@implementation LeftViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.bounces = NO;
    self.tableView.backgroundColor = [UIColor darkGrayColor];
    self.tableView.separatorColor = [UIColor grayColor];
    self.menus = @[@"选择城市",@"首页",@"景点",@"餐饮",@"酒店",@"休闲",@"购物",@"更多",@"我"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.menus count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"LeftCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
//    cell.textLabel.textColor = [UIColor whiteColor];
//    cell.textLabel.text = [self.menus objectAtIndex:indexPath.row];
    UILabel *msg = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 110, cell.bounds.size.height)];
    msg.backgroundColor = [UIColor darkGrayColor];
    msg.textColor = [UIColor whiteColor];
    msg.text = [self.menus objectAtIndex:indexPath.row];
    [cell addSubview:msg];
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    [self.viewDeckController closeLeftViewBouncing:^(IIViewDeckController *controller) {
//        if ([controller.centerController isKindOfClass:[UINavigationController class]]) {
//            UITableViewController* cc = (UITableViewController*)((UINavigationController*)controller.centerController).topViewController;
//            cc.navigationItem.title = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
//            if ([cc respondsToSelector:@selector(tableView)]) {
//                [cc.tableView deselectRowAtIndexPath:[cc.tableView indexPathForSelectedRow] animated:NO];    
//            }
//        }
//        [NSThread sleepForTimeInterval:(300+arc4random()%700)/1000000.0]; // mimic delay... not really necessary
//    }];
    
//    NSLog(@"nav is %@",SharedAppDelegate.centerController);
//    ChoiceCityViewController *cityViewController = [[ChoiceCityViewController alloc] init];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:cityViewController];
    
    switch (indexPath.row) {
        case 0:
            [self choiceCityPage];
            break;
        case 1:
            [self indexPage];
            break;
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
            [self listPage: [self.menus objectAtIndex:indexPath.row]];
            break;
        case 7:
            [self morePage];
            break;
        case 8:
            [self minePage];
            break;
    }
}

//选择城市页面
-(void)choiceCityPage{
//    self.viewDeckController.centerController =
    ChoiceCityViewController *choiceCityViewController = [storyboard instantiateViewControllerWithIdentifier:@"choiceCityViewController"];
    UINavigationController *navController = nil;
    if ([self.viewDeckController.centerController isKindOfClass:[UINavigationController class]]) {
        navController = (UINavigationController *)self.viewDeckController.centerController;
    }else{
        navController = [[UINavigationController alloc] initWithRootViewController:self.viewDeckController.centerController];
    }
    [navController pushViewController:choiceCityViewController animated:NO];
    self.viewDeckController.centerController = navController;
    [self.viewDeckController closeLeftView];
}

//首页
-(void)indexPage{
    self.viewDeckController.centerController = [storyboard instantiateViewControllerWithIdentifier:@"indexViewController"];
    if (self.viewDeckController.leftController==nil) {
        self.viewDeckController.leftController = SharedAppDelegate.leftController;
    }
    if (self.viewDeckController.rightController==nil) {
        self.viewDeckController.rightController = SharedAppDelegate.rightController;
    }
    [self.viewDeckController closeLeftView];
}

//景点，餐饮，酒店，休闲，购物列表页面
-(void)listPage:(NSString *) typeName{
    self.viewDeckController.centerController = [storyboard instantiateViewControllerWithIdentifier:@"listViewController"];
    NSLog(@"view is %@ and typename is %@",self.viewDeckController.centerController,typeName);
    self.viewDeckController.centerController.navigationController.title = typeName;
    if (self.viewDeckController.leftController==nil) {
        self.viewDeckController.leftController = SharedAppDelegate.leftController;
    }
    if (self.viewDeckController.rightController==nil) {
        self.viewDeckController.rightController = SharedAppDelegate.rightController;
    }
    [self.viewDeckController closeLeftView];
}

//更多设置页面
-(void)morePage{
    self.viewDeckController.centerController = [storyboard instantiateViewControllerWithIdentifier:@"moreViewController"];
    if (self.viewDeckController.leftController==nil) {
        self.viewDeckController.leftController = SharedAppDelegate.leftController;
    }
    if (self.viewDeckController.rightController!=nil) {
        [self.viewDeckController performSelector:@selector(setRightController:) withObject:nil afterDelay:1];
    }
    [self.viewDeckController closeLeftView];
}

//我
-(void)minePage{
    self.viewDeckController.centerController = [storyboard instantiateViewControllerWithIdentifier:@"mineViewController"];
    if (self.viewDeckController.leftController==nil) {
        self.viewDeckController.leftController = SharedAppDelegate.leftController;
    }
    if (self.viewDeckController.rightController!=nil) {
        [self.viewDeckController performSelector:@selector(setRightController:) withObject:nil afterDelay:1];
    }
    [self.viewDeckController closeLeftView];
}
@end
