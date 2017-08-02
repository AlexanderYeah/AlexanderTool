//
//  ViewController.m
//  AYToolDemo
//
//  Created by AY on 2017/8/1.
//  Copyright © 2017年 AlexanderYeah. All rights reserved.
//

#import "ViewController.h"
#import "StarsViewController.h"
#import "ImgHandleViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
/** 数据源数组 */
@property (nonatomic,strong)NSMutableArray *dataArr;
/** tableview */
@property (nonatomic,strong)UITableView *mainTableView;

@end

@implementation ViewController

#pragma mark - 0 懒加载
- (NSMutableArray *)dataArr
{
	if (!_dataArr) {
		
		NSArray *arr = @[@"点评星星",@"图片处理"];
		_dataArr = [NSMutableArray arrayWithCapacity:0];
		[_dataArr addObjectsFromArray:arr];
	}
	return _dataArr;
}
- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.navigationItem.title = @"Demo";
	[self createUI];
}

#pragma mark - 1 UI 搭建

- (void)createUI{

	
	_mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, kScreenW, kScreenH - 64) style:UITableViewStylePlain];
	
	_mainTableView.delegate = self;
	_mainTableView.dataSource = self;
	_mainTableView.rowHeight = 50;
	[self.view addSubview:_mainTableView];
	
}


#pragma mark - 2 数据请求

#pragma mark - 3 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return  self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cellID";
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
	cell.textLabel.text  = self.dataArr[indexPath.row];
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	switch (indexPath.row) {
  case 0:
    {
		StarsViewController *starVC = [[StarsViewController alloc]init];
		starVC.view.backgroundColor = [UIColor whiteColor];
		[self.navigationController pushViewController:starVC animated:YES];
	}
    break;
	case 1:{
		ImgHandleViewController *imgVC = [[ImgHandleViewController alloc]init];
		imgVC.view.backgroundColor = [UIColor whiteColor];
		imgVC.navigationItem.title = @"图片处理";
		[self.navigationController pushViewController:imgVC animated:YES];
	}break;

  default:
    break;
}

}


#pragma mark - 4 方法抽取

#pragma mark - 5 事件响应


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
