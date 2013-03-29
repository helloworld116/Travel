//
//  LeftViewController.m
//  ViewDeckExample
//


#import "RightViewController.h"
#import "IIViewDeckController.h"

@implementation RightViewController

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
    self.menus = @[@"搜索",@"照相",@"写日志"];
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
    static NSString *CellIdentifier = @"RightCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    UILabel *msg = [[UILabel alloc] initWithFrame:CGRectMake(cell.bounds.size.width-80, 0, 80, cell.bounds.size.height)];
    msg.backgroundColor = [UIColor darkGrayColor];
    msg.textColor = [UIColor whiteColor];
    msg.text = [self.menus objectAtIndex:indexPath.row];
    [cell addSubview:msg];
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.row) {
        case 0:
            [self searchPage];
            break;
        case 1:
            [self photographPage];
            break;
        case 2:
            [self writeLogPage];
            break;
    }
}

//搜索页面
-(void)searchPage{
    
}

//拍照页面
-(void)photographPage{
    
}

//写日志页面
-(void)writeLogPage{
    
}

@end
