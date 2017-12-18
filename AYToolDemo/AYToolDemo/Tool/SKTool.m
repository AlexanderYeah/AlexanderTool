//
//  SKTool.m
//  SmartFire
//
//  Created by AY on 2017/11/23.
//  Copyright © 2017年 xunli. All rights reserved.
//

#import "SKTool.h"

@implementation SKTool

/** 时间戳转为时间 */
+ (NSString *)changeTimestampWithStr:(NSString *)stamp
{
	
    NSTimeInterval time=[stamp doubleValue]+28800 ;//因为时差问题要加8小时 == 28800 sec
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time / 1000];
    NSLog(@"date:%@",[detaildate description]);
//实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
 
    NSString *currentDateStr = [dateFormatter stringFromDate: detaildate];
	
	return currentDateStr;
}


/** 输入省份的名字 获取对应的省份编码code */
+ (NSString *)getProviceCodeWithString:(NSString *)provinceStr
{
	 // 获取文件路径  
    NSString *path = [[NSBundle mainBundle] pathForResource:@"province_code" ofType:@"json"];
    // 将文件数据化  
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];  
    // 对数据进行JSON格式化并返回字典形式  
    NSDictionary *provinceDic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
	NSArray *provinceArr = provinceDic[@"provice_code"];
	for (NSDictionary *dic in provinceArr) {
		if ([dic[@"name"] isEqualToString:provinceStr]) {
			return dic[@"code"];
		}
	}
	return @"NO";
}


/** 输入城市的名字 获取对应的省份编码code */
+ (NSString *)getCityCodeWithString:(NSString *)cityStr{
	// 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"province_code" ofType:@"json"];
    // 将文件数据化  
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];  
    // 对数据进行JSON格式化并返回字典形式  
    NSDictionary *cityDic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
	
	NSArray *cityArr = cityDic[@"city_code"];
	
	
	for (NSDictionary *dic in cityArr) {
		if ([dic[@"name"] isEqualToString:cityStr]) {
			return dic[@"code"];
		}
	}
	return @"NO";
}
/** 输入区域的名字 获取对应的区域编码code */
+ (NSString *)getAreaCodeWithString:(NSString *)areaStr{
	
	// 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"province_code" ofType:@"json"];
    // 将文件数据化  
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];  
    // 对数据进行JSON格式化并返回字典形式  
    NSDictionary *areaDic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
	NSArray *areaArr = areaDic[@"area_code"];
	for (NSDictionary *dic in areaArr) {
		if ([dic[@"name"] isEqualToString:areaStr]) {
			return dic[@"code"];
		}
	}
	
	return @"NO";
}

@end
