//
//  UIImage+Mark.h
//  AYToolDemo
//
//  Created by AY on 2017/8/2.
//  Copyright © 2017年 AlexanderYeah. All rights reserved.
//

#import <UIKit/UIKit.h>
// 添加水印
@interface UIImage (Mark)


/**
 传入图片 生成 水印图片

 @param markImg 添加水印的图片
 @param title 水印的标题
 @return 返回的图片
 */
+ (UIImage *)imageWithMarkImg:(UIImage *)markImg withMarkTitle:(NSString *)title withPoint:(CGPoint)point fontSize:(CGFloat)fontSize;
@end
