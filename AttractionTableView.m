//
//  AttractionTableView.m
//  Travel
//
//  Created by apple on 13-3-21.
//  Copyright (c) 2013年 com.jdtx. All rights reserved.
//

#import "AttractionTableView.h"
#import "AttractionCell.h"

@implementation AttractionTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.dataSource = self;
        self.delegate = self;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

#pragma mark UITableViewDataSource required method
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //mode1
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:@"AttractionCell"
                                                    owner:self options:nil];
    AttractionCell *cell = (AttractionCell *)[bundle objectAtIndex:0];
//    //mode2
//    static NSString *cellName = @"AttractionCell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
//    if(cell == nil){
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
//    }
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:cell.imageView];
    
    //load the image
    NSDictionary *dict = [[self.attractionInfo objectForKey:@"data"] objectAtIndex:indexPath.row];
    cell.imageView.imageURL = [NSURL URLWithString:[[self.attractionInfo objectForKey:@"imgserver"] stringByAppendingString:[dict objectForKey:@"def_pic"]]];
    cell.name = [dict objectForKey:@"s_name"];
    cell.detail = [dict objectForKey:@"address"];
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self.attractionInfo objectForKey:@"data"] count];
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
    return 180.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}
@end
