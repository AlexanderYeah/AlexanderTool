//
//  StarsViewController.m
//  AYToolDemo
//
//  Created by AY on 2017/8/2.
//  Copyright © 2017年 AlexanderYeah. All rights reserved.
//

#import "StarsViewController.h"

@interface StarsViewController ()


/** 评分图片 */
@property (nonatomic,strong)UIImageView *scoreImgView;

@end

@implementation StarsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	[self createUI];
	
}

- (void)createUI{

	UIImageView * scoreBgImgView = [[UIImageView alloc]init];
    scoreBgImgView.image = SKImage(@"StarsBackground");
    scoreBgImgView.contentMode = UIViewContentModeLeft;
    scoreBgImgView.clipsToBounds = YES;
    [self.view addSubview:scoreBgImgView];
    [scoreBgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(120);
        make.left.equalTo(self.view.mas_left).offset(25);
        make.width.equalTo(65);
        make.height.equalTo(23);
    }];

	_scoreImgView = [[UIImageView alloc]init];
    _scoreImgView.image = SKImage(@"StarsForeground");
    _scoreImgView.contentMode = UIViewContentModeLeft;
    _scoreImgView.clipsToBounds = YES;
    [self.view addSubview:_scoreImgView];
    //    _scoreImgView.frame.size.width = 65 / 5 * 10;
 	[_scoreImgView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self.view.mas_top).offset(120);
        make.left.equalTo(self.view.mas_left).offset(25);
        make.width.equalTo(25);
        make.height.equalTo(23);
	}];

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
