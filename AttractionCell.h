//
//  AttractionCell.h
//  Travel
//
//  Created by apple on 13-3-21.
//  Copyright (c) 2013年 com.jdtx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AttractionCell : UITableViewCell
@property (strong, nonatomic) IBOutlet AsyncImageView *imageView;
@property (strong, nonatomic) IBOutlet UIView *layer;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *detail;

@end
