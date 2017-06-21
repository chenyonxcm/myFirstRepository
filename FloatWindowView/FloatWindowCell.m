//
//  FloatWindowCell.m
//  FloatWindowView
//
//  Created by chenyong on 17/6/19.
//  Copyright © 2017年 chenyong. All rights reserved.
//

#import "FloatWindowCell.h"
#import <Masonry.h>

#define kCellHeightWithoutText 25.0
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface FloatWindowCell ()

@property (strong, nonatomic) UILabel *content;

@end

@implementation FloatWindowCell

+ (CGFloat)heightForCellWithString:(NSString *)string {
    if (!string.length) {
        return 44.0;
    }
    
    NSMutableDictionary *attr2 = [NSMutableDictionary dictionary];
    [attr2 setObject:[UIFont systemFontOfSize:12] forKey:NSFontAttributeName];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 5;
    [attr2 setObject:style forKey:NSParagraphStyleAttributeName];
    NSAttributedString *content = [[NSAttributedString alloc] initWithString:string attributes:attr2];
    CGFloat contentHeight = [content boundingRectWithSize:CGSizeMake(kScreenWidth - 50*2 - 30 , 2000) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size.height;
    
    return kCellHeightWithoutText + contentHeight;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:12];
    label.textAlignment = NSTextAlignmentLeft;
    label.numberOfLines = 0;
    [self.contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.mas_left).offset(15);
        make.right.equalTo(self.mas_right).offset(-15);
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self);
    }];
    self.content = label;
}

- (void)setupData:(NSString *)string {
    
    NSMutableDictionary *attr2 = [NSMutableDictionary dictionary];
    [attr2 setObject:[UIFont systemFontOfSize:12] forKey:NSFontAttributeName];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 5;
    [attr2 setObject:style forKey:NSParagraphStyleAttributeName];
    NSAttributedString *content = [[NSAttributedString alloc] initWithString:string attributes:attr2];
    self.content.attributedText = content;
    NSLog(@"%@",self.content.attributedText);
}
@end
