//
//  ImgHandleViewController.m
//  AYToolDemo
//
//  Created by AY on 2017/8/2.
//  Copyright © 2017年 AlexanderYeah. All rights reserved.
//

#import "ImgHandleViewController.h"
#import "UIImage+ClipImage.h"
#import "UIImage+Mark.h"
@interface ImgHandleViewController ()

@end

@implementation ImgHandleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	
	[self clipImg];
	
	[self markImg];
	
	
}

/* 1 剪裁图片 **/
- (void)clipImg
{
	UIImageView *headImgView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 100, 80, 80)];
	headImgView.image = [UIImage imageWithClipImage:SKImage(@"1") boarder:1 boardColor:[UIColor redColor]];
	[self.view addSubview:headImgView];

}
/* 2 添加水印 **/
- (void)markImg
{
	UIImageView *headImgView = [[UIImageView alloc]initWithFrame:CGRectMake(120, 100, 120, 120)];
	headImgView.image = [UIImage imageWithMarkImg:SKImage(@"1") withMarkTitle:@"AlexanderYeah" withPoint:CGPointMake(50, 50) fontSize:45];
	[self.view addSubview:headImgView];
	
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
