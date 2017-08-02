//
//  UIImage+ClipImage.m
//  裁剪图片
//
//  Created by alexander on 16/3/22.
//  Copyright (c) 2016年 Yeshengke. All rights reserved.
//

#import "UIImage+ClipImage.h"

@implementation UIImage (ClipImage)
#pragma mark - 剪裁图片并且添加圆环
+ (UIImage *)imageWithClipImage:(UIImage *)image boarder:(CGFloat)bWidth boardColor:(UIColor *)bColor
{
    
    CGFloat boarder = bWidth;
    CGFloat imgW = image.size.width;
    CGFloat imgH = image.size.height;
    // 2 开启绘图上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(imgW + boarder *2, imgH + boarder * 2), NO, 0);
    // 3 绘制底部圆形,
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, imgW + boarder * 2, imgH + boarder * 2)];
    // 3.1 设置圆环的颜色
    [bColor set];
    [path fill];
    // 4 设置剪裁区域
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(boarder, boarder, imgW, imgH)];
    // 4.1 添加路径到剪裁区域
    [clipPath addClip];
    // 5 绘制图片
    [image drawAtPoint:CGPointMake(boarder, boarder)];
    // 6 获取图片
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    // 7 关闭上下文
    UIGraphicsEndPDFContext();
    
    return newImg;
}

#pragma mark - 剪裁图片 
+ (UIImage *)imageWithClipImage:(UIImage *)image
{
    
    // 2 创建绘图上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    // 3 创建路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    // 3.1 把路径设置为剪裁区域
    [path addClip];
    // 4 图片绘制到路径
    [image drawAtPoint:CGPointZero];
    // 5 从上下文中取得图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 6 关闭上下文
    UIGraphicsEndPDFContext();
    return newImage;
    
}

@end
