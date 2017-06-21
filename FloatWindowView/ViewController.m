//
//  ViewController.m
//  FloatWindowView
//
//  Created by chenyong on 17/6/19.
//  Copyright © 2017年 chenyong. All rights reserved.
//

#import "ViewController.h"

#import "FloatWindowCell.h"

#define TableViewWith [UIScreen mainScreen].bounds.size.width
#define TableViewHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *containerArry;
@property (nonatomic, strong) UIImageView *closeImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.tableView];
    
    self.containerArry = [NSArray arrayWithObjects:@"1.中星9A卫星，是我国首颗国产广播电视直播卫星，采用中国航天科技集团公司空间技术研究院自主研发的东方红四号卫星平台，提供Ku BSS规划频段转发器直播服务。",@"2.其实晚上我做了很多的思想斗争，我说一定要试一下，如果我不试的话，大家就克服不了这个恐惧，这个任务这个课目我们很有可能就完成不了。",@"3.抗议民众说，这个当局真的很无能，台湾交给你蔡英文，就是要你去好好增加收入，搞好台湾的经济，结果却还是在搞意识形态、一上台就搞对立，弄到每天都有人在抗争，蔡英文不知民间疾苦，还当什么领导人？",@"4.KOTRA方面分析指出，在韩国和中国围绕“萨德”矛盾升级的情况下，两国进出口贸易连续六个月增加，归因于中国经济回暖，国际油价上涨，半导体行业进入景气周期，上年度对华出口骤减带来的基数效应等",@"5.“2001年2月10日，在距夏威夷瓦胡岛约16公里海面，一艘日本爱媛县宇和岛水产高中的“爱媛”号实习拖网渔船，突然与异物相撞，渔船很快沉没。当时船上共有35名乘员，全部落水，9名师生、船员遇难。", nil];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(50, 150, TableViewWith - 50*2, TableViewHeight - 100*2 - 64) style:UITableViewStylePlain];
        _tableView.layer.masksToBounds = YES;
        _tableView.layer.cornerRadius = 5;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = YES;
        
//        _closeImageView = [[UIImageView alloc] init];
//        _closeImageView.backgroundColor = [UIColor purpleColor];
//        [_tableView addSubview:_closeImageView];
//        _closeImageView.frame = CGRectMake(_tableView.bounds.size.width - 8, -8, 16, 16);
//        _closeImageView.image = [UIImage imageNamed:@"btn_news_close"];
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeImage:)];
        [_tableView addGestureRecognizer:gesture];
        _tableView.userInteractionEnabled = YES;
    }
    
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _containerArry.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *detailString = _containerArry[indexPath.row];
    return [FloatWindowCell heightForCellWithString:detailString];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIndex = @"cell";
    FloatWindowCell *floatWindowCell = [tableView dequeueReusableCellWithIdentifier:cellIndex];
    if (!floatWindowCell) {
        floatWindowCell = [[FloatWindowCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndex];
    }
    [floatWindowCell setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];

    NSString *detailString = _containerArry[indexPath.row];
    if (detailString.length) {
        [floatWindowCell setupData:detailString];
    }

    return floatWindowCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return  0.001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001;
}

- (void)closeImage:(UITapGestureRecognizer *)gesture {
    [_tableView removeFromSuperview];
    _tableView = nil;
    
    self.view.backgroundColor = [UIColor whiteColor];
}
@end
