//
//  ListTableView.m
//  Travel
//
//  Created by apple on 13-3-26.
//  Copyright (c) 2013年 com.jdtx. All rights reserved.
//

#import "ListTableView.h"

@implementation ListTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark UITableViewDataSource required method
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //mode1
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"ListCell"
                                                    owner:self options:nil];
    ListCell *cell = (ListCell *)[bundle objectAtIndex:0];
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:cell.ivBackground];
    //load the image
    NSDictionary *dict = [[self.data objectForKey:@"data"] objectAtIndex:indexPath.row];
    cell.ivBackground.imageURL = [NSURL URLWithString:[[self.data objectForKey:@"imgserver"] stringByAppendingString:[dict objectForKey:@"def_pic"]]];    
    cell.lblName = [dict objectForKey:@"s_name"];
    cell.lblPrice = [dict objectForKey:@"price"];
    cell.lblAddress = [dict objectForKey:@"address"];
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self.data objectForKey:@"data"] count];
}

#pragma mark UITableViewDataSource option method
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//
//}
//
//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
//
//}
//
//- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
//
//}
//
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//
//}
//
//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
//
//}

#pragma mark UITableViewDelegate option method
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
