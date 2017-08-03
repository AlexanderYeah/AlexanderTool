//
//  VerifyCodeViewController.m
//  AYToolDemo
//
//  Created by AY on 2017/8/3.
//  Copyright © 2017年 AlexanderYeah. All rights reserved.
//

#import "VerifyCodeViewController.h"

@interface VerifyCodeViewController ()
/** 发送验证码按钮 */
@property (nonatomic,strong)UIButton *codeBtn;

@end

@implementation VerifyCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	_codeBtn = [self createBtnWithTitle:@"获取验证码"];
    [self.view addSubview:_codeBtn];
    [_codeBtn addTarget:self action:@selector(startTime) forControlEvents:UIControlEventTouchUpInside];
}



- (UIButton *)createBtnWithTitle:(NSString *)title
{
    
    UIButton *btn = [[UIButton alloc]init];
    btn.backgroundColor = [UIColor redColor];
    btn.frame = CGRectMake(100, 100, 200, 70);
    [btn setTitle:title forState:UIControlStateNormal];
    
    return btn;
    
}


-(void)startTime
{
    __block int timeout= 59; //倒计时时间
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        
        if(timeout<=0){ //倒计时结束，关闭
            
            dispatch_source_cancel(_timer);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置界面的按钮显示 根据自己需求设置
                
                [_codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
                
                _codeBtn.userInteractionEnabled = YES;
                
            });
            
        }else{
            
            //            int minutes = timeout / 60;
            
            int seconds = timeout % 60;
            
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置界面的按钮显示 根据自己需求设置
                
                [UIView beginAnimations:nil context:nil];
                
                [UIView setAnimationDuration:1];
                
                [_codeBtn setTitle:[NSString stringWithFormat:@"%@秒重发",strTime] forState:UIControlStateNormal];
                
                [UIView commitAnimations];
                
                _codeBtn.userInteractionEnabled = NO;
                
            });
            
            timeout--;
            
        }
        
    });
    
    dispatch_resume(_timer);

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
