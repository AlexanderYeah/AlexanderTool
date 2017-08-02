//
//  UIImage+Mark.m
//  AYToolDemo
//
//  Created by AY on 2017/8/2.
//  Copyright © 2017年 AlexanderYeah. All rights reserved.
//

#import "UIImage+Mark.h"

@implementation UIImage (Mark)

+(UIImage *)imageWithMarkImg:(UIImage *)markImg withMarkTitle:(NSString *)title withPoint:(CGPoint)point fontSize:(CGFloat)fontSize;
{
	// 1 获取上下文，之前的上下文都是在view的drawRect方法中获取，（跟view相关联的上下文都是layer上下文）
    // 目前我们要绘制图片到新的图片上面去，因此要使用位图上下文
    // 怎么获取位图上下文：注意位图上下文的获取方式跟layer上下文的不一样，位图上下文需要我们手动去创建
    // 开启一个位图上下文
    // size  : 上下文的尺寸，即新图片的尺寸。
    // opaque ：不透明度 YES 表示不透明 NO 透明 ，一般我们都弄透明的上下文
    // scale ：需不需要对上下文进行缩放，通常不需要，取值为0，不缩放
	
	UIGraphicsBeginImageContextWithOptions(markImg.size, NO, 0);
	
	// 2 绘制原生图片
	[markImg drawAtPoint:CGPointZero];
	// 3 给图片添加文字
	NSString *str = title;
	NSMutableDictionary *textDic = [NSMutableDictionary dictionary];
	
	textDic[NSForegroundColorAttributeName] = [UIColor redColor];
	textDic[NSFontAttributeName] = [UIFont systemFontOfSize:fontSize];
	[str drawAtPoint:point withAttributes:textDic];
	
	
	// 4 生成一张图片给我们
	UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
	// 5 关闭，一旦创建了就开辟了内存，所以要进行关闭
	UIGraphicsEndImageContext();
	
	return newImg;
	

}

@end
