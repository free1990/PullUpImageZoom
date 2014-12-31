//
//  KLHeader.m
//  KLDynamicTabHeader
//
//  Created by John on 14-2-10.
//  Copyright (c) 2014年 John. All rights reserved.
//

#import "KLHeader.h"

@implementation KLHeader

- (instancetype) initWithScroller:(UIScrollView *)scroller BackgroundImage:(UIImage*)backImg icon:(UIImage *)iconImg title:(NSString *)title subTitle:(NSString *)subTitle
{
    if((self = [super initWithFrame:CGRectMake(scroller.frame.origin.x, scroller.frame.origin.y, scroller.bounds.size.width, backImg.size.height)]))
    {
        self.clipsToBounds = YES;
        backImgView = [[UIImageView alloc]initWithImage:backImg];
        CGRect backFrame = backImgView.frame;
        backFrame.size.width = scroller.bounds.size.width;
        [backImgView setFrame:backFrame];
        iconImgView = [[UIImageView alloc]initWithImage:iconImg];
        [iconImgView setBounds:CGRectMake(0, 0, iconImg.size.width, iconImg.size.height)];
        titleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        subLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        [self addSubview:backImgView];
        [self addSubview:iconImgView];
        [self addSubview:titleLabel];
        [self addSubview:subLabel];
        self.scroller = scroller;
        [self offsetY:kHeaderStatusHeight];
        [self.scroller addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:Nil];
    }
    return self;
}

- (void)offsetY:(float)y
{
    CGRect mainFrame = self.frame;
    mainFrame.origin.y = y;
    [self setFrame:mainFrame];
    dy = mainFrame.origin.y;
    [self.scroller setContentInset:UIEdgeInsetsMake(self.bounds.size.height-(20-kHeaderStatusHeight), 0, 0, 0)];
    max = self.bounds.size.height + (dy==0?20:0);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    CGPoint point = [change[@"new"] CGPointValue];
    CGRect mainRect = self.frame;
    min = (dy==0)?kHeaderMinHeight+20:kHeaderMinHeight;
    mainRect.size.height = (-point.y-dy>min)?-point.y-dy:min;
    self.frame = mainRect;
    
//    1~0
    progress = (mainRect.size.height-min)/(max-min);
    if(progress>1)progress = 1;
    if(progress<0)progress = 0;
  
//    animation
    [iconImgView setCenter:self.center];
    [backImgView.layer setTransform:CATransform3DMakeScale(1+1-progress, 1+1-progress, 1)];
    
}
@end