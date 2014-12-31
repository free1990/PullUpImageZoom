//
//  KLMainViewController.h
//  KLDynamicTabHeader
//
//  Created by John on 14-2-10.
//  Copyright (c) 2014年 John. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KLHeader.h"

@interface KLMainViewController : UIViewController < UITableViewDataSource , UITableViewDelegate>
{
    UITableView *_tableView;
    KLHeader *header;
}
@end
