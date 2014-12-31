//
//  KLMainViewController.m
//  KLDynamicTabHeader
//
//  Created by John on 14-2-10.
//  Copyright (c) 2014年 John. All rights reserved.
//

#import "KLMainViewController.h"

@implementation KLMainViewController

- (void)loadView
{
    [super loadView];
    
    [self.navigationController setNavigationBarHidden:YES];
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    [self.view addSubview:_tableView];
    
    header = [[KLHeader alloc]initWithScroller:_tableView
                               BackgroundImage:[UIImage imageNamed:@"IMG_0152.jpg"]
                                          icon:[UIImage imageNamed:@"hero"]
                                         title:@"title"
                                      subTitle:@"subTitle"];
    [self.view addSubview:header];
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell)
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    [cell.textLabel setText:[NSString stringWithFormat:@"%d" , indexPath.row]];
    [cell.textLabel setTextColor:[UIColor colorWithRed:indexPath.row*3/255.f green:indexPath.row/255.f blue:indexPath.row*10/255.f alpha:1]];
    [cell setBackgroundColor:[UIColor colorWithRed:1-indexPath.row*5/255.f green:1-indexPath.row*4/255.f blue:1-indexPath.row*3/255.f alpha:1]];
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

@end
