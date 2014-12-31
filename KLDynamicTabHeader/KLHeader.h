//
//  KLHeader.h
//  KLDynamicTabHeader
//
//  Created by John on 14-2-10.
//  Copyright (c) 2014年 John. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kHeaderMinHeight 44
#define kHeaderStatusHeight 0
@interface KLHeader : UIView
{
    UIImageView *backImgView;
    UIImageView *iconImgView;
    UILabel *titleLabel;
    UILabel *subLabel;
    float dy;
    float max;
    float min;
    float progress;
}

@property (nonatomic , assign) UIScrollView *scroller;

- (instancetype) initWithScroller:(UIScrollView *)scroller BackgroundImage:(UIImage*)backImg icon:(UIImage *)iconImg title:(NSString *)title subTitle:(NSString *)subTitle;
- (void)offsetY:(float)y;
@end
