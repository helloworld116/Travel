//
//  ListCell.h
//  Travel
//
//  Created by apple on 13-3-26.
//  Copyright (c) 2013年 com.jdtx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListCell : UITableViewCell

@property (strong, nonatomic) IBOutlet AsyncImageView *ivBackground;
@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UIImageView *ivStar;
@property (strong, nonatomic) IBOutlet UILabel *lblPrice;
@property (strong, nonatomic) IBOutlet UILabel *lblAddress;

@end
