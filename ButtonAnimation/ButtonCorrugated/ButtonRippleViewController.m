//
//  ButtonRippleViewController.m
//  ButtonAnimation
//
//  Created by WJia on 2018/11/15.
//  Copyright © 2018年 WJia. All rights reserved.
//

#import "ButtonRippleViewController.h"

#import "ButtonAnimation-Swift.h"
//此头文件是潜在生成的!固定格式是这样(项目名-Swift.h)可以选中targets->build settings ->packaging->Product Module Name, 在这里查看和设置模块名，这个名称很重要 swift 的头文件就是根据这个来命名的。  此头文件如果找不到,基本原因是因为移动了ButtonAnimation-Bridging-Header.h文件的路径,将此文件放回默认处即可


@interface ButtonRippleViewController ()
{
    CGFloat buttonScale;//动画波纹比例
    
}
@property (nonatomic, strong) WJRippleButton *wjRipButton;

@end

@implementation ButtonRippleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    //初始化button
    _wjRipButton = [[WJRippleButton alloc] initWithFrame:CGRectMake(0, 0, 300, 300) rippleColor:[UIColor redColor]];
    _wjRipButton.center = self.view.center;
    
    [_wjRipButton addTarget:self action:@selector(buttonDownAction:) forControlEvents:UIControlEventTouchDown];
    [_wjRipButton addTarget:self action:@selector(buttonActionInside:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
    [_wjRipButton setTitle:@"按住启动" forState:UIControlStateNormal];

    [self.view addSubview:_wjRipButton];
}
/**
 *  按钮按下时，执行的方法
 */
- (void)buttonDownAction:(UIButton *)sender{
    sender.selected = YES;
    [sender setTitle:@"松开停止" forState:UIControlStateNormal];
}
/**
 *  松开按钮时，执行的方法
 */
- (void)buttonActionInside:(UIButton *)sender{
    [sender setTitle:@"按住启动" forState:UIControlStateNormal];
    sender.selected = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
