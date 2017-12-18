//
//  GetCityCodeViewController.m
//  AYToolDemo
//
//  Created by Alexander on 2017/12/18.
//  Copyright © 2017年 AlexanderYeah. All rights reserved.
//

#import "GetCityCodeViewController.h"
#import "SKTool.h"
@interface GetCityCodeViewController ()
@property (weak, nonatomic) IBOutlet UILabel *provinceCodeLbl;
@property (weak, nonatomic) IBOutlet UILabel *cityCodeLbl;
@property (weak, nonatomic) IBOutlet UILabel *areaCodeLbl;

@end

@implementation GetCityCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
	self.provinceCodeLbl.text = [NSString stringWithFormat:@"河南省:%@",[SKTool getProviceCodeWithString:@"河南省"]];
	self.cityCodeLbl.text = [NSString stringWithFormat:@"郑州市:%@",[SKTool getCityCodeWithString:@"郑州市"]];
	self.areaCodeLbl.text = [NSString stringWithFormat:@"金水区:%@",[SKTool getAreaCodeWithString:@"金水区"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
