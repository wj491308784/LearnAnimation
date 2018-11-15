//
//  ViewController.m
//  ButtonAnimation
//
//  Created by WJia on 2018/11/15.
//  Copyright © 2018年 WJia. All rights reserved.
//

#import "ViewController.h"
#import "ButtonRippleViewController.h"
#import "TitelModel.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *systemTableV;
@property (nonatomic, strong) TitelModel *titleModel;
@property (nonatomic, strong) NSArray *dataTabVArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self getdata];
    [self.view addSubview:self.systemTableV];
}
- (void)getdata {
    
    self.dataTabVArray = @[self.titleModel];//可加数据到此模型里来赋给dataTabVArray数组
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataTabVArray.count;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataTabVArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1.创建系统cell
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    //1.取出对应组的模型
    _titleModel = _dataTabVArray[indexPath.section];
    //2.取出对应行的数据...此处不弄假数据了
    //...
    cell.textLabel.text = _titleModel.TitleName;
    cell.detailTextLabel.text = _titleModel.TitleNum;

    // 3.返回要显示的控件
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}
//======delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ButtonRippleViewController *brController = [[ButtonRippleViewController alloc] init];
    switch (indexPath.section) {
        case 0:
            [self.navigationController pushViewController:brController animated:YES];
            break;
            
        default:
            break;
    }
}


- (UITableView *)systemTableV {
    if (!_systemTableV) {
        _systemTableV = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _systemTableV.delegate = self;
        _systemTableV.dataSource = self;
    }
    return _systemTableV;
}
- (NSArray *)dataTabVArray {
    if (!_dataTabVArray) {
        _dataTabVArray = [NSArray array];
    }
    return _dataTabVArray;
}
- (TitelModel *)titleModel {
    if (!_titleModel) {
        _titleModel = [[TitelModel alloc] init];
        _titleModel.TitleNum = @"666";
        _titleModel.TitleName = @"波纹动画";
    }
    return _titleModel;
}


@end
