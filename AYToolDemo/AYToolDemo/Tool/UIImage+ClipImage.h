//
//  UIImage+ClipImage.h
//  裁剪图片
//
//  Created by alexander on 16/3/22.
//  Copyright (c) 2016年 Yeshengke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ClipImage)
/**
 *  剪裁图片，给图片添加圆环
 *
 *  @param image  待剪裁的图片
 *  @param bWidth 圆环宽度
 *  @param bColor 圆环颜色
 *
 *  @return 剪裁完的图片
 */
+ (UIImage *)imageWithClipImage:(UIImage *)image boarder:(CGFloat)bWidth boardColor:(UIColor *)bColor;
/**
 *  剪裁成圆形的图片
 */
+ (UIImage *)imageWithClipImage:(UIImage *)image;

@end
