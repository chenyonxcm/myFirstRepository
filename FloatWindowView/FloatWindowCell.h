//
//  FloatWindowCell.h
//  FloatWindowView
//
//  Created by chenyong on 17/6/19.
//  Copyright © 2017年 chenyong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FloatWindowCell : UITableViewCell

+ (CGFloat)heightForCellWithString:(NSString *)string;

- (void)setupData:(NSString *)string;
@end
