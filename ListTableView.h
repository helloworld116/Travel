//
//  ListTableView.h
//  Travel
//
//  Created by apple on 13-3-26.
//  Copyright (c) 2013年 com.jdtx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListCell.h"

@interface ListTableView : UITableView<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,retain) NSDictionary *data;

@end
