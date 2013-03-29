//
//  AttractionTableView.h
//  Travel
//
//  Created by apple on 13-3-21.
//  Copyright (c) 2013年 com.jdtx. All rights reserved.
//

@interface AttractionTableView : UITableView<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain) NSDictionary *attractionInfo;
@end
