//
//  DropDownView.m
//  DropDownMenuStudy
//
//  Created by caiqiujun on 16/2/3.
//  Copyright © 2016年 caiqiujun. All rights reserved.
//

#import "DropDownView.h"
#import "BottomView.h"

@interface DropDownView ()
/// 灰色背景视图
@property (nonatomic, strong)UIView *backView;
/// 灰色背景视图
@property (nonatomic, strong)UIView *downView;

@end

@implementation DropDownView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        // 增加单机手势
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideDropDownView:)];
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:gesture];
        
        [self showDropDownView];
        
        [self setBottomView];
    }
    return self;
}

/**
 *  设置底部边框
 */
- (void)setBottomView {
    BottomView *bottomView = [[BottomView alloc] initWithFrame:CGRectMake(0, self.downView.frame.size.height - self.downView.frame.size.width * 0.06, self.downView.frame.size.width, self.downView.frame.size.width * 0.06)];
    [self.downView addSubview:bottomView];
}

/**
 *  显示下拉视图
 */
-(void)showDropDownView {
    
    if (self.downView == nil) {
        self.downView = [[UIView alloc] initWithFrame:CGRectMake(0, - self.frame.size.width * 1.128 / 2, self.frame.size.width, self.frame.size.width * 1.128)];
        self.downView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.downView];
    }
    
    // 设置下拉的动画
    self.downView.layer.anchorPoint = CGPointMake(0.5, 0);
    self.downView.transform = CGAffineTransformMakeScale(1.0, 0.00001);
    self.alpha = 0;
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 1;
        self.downView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    }];
}


/**
 *  隐藏下拉视图
 */
-(void)hideDropDownView {
    [UIView animateWithDuration:0.3 animations:^{
        
        self.alpha = 0;
        self.downView.transform = CGAffineTransformMakeScale(1.0, 0.00001);
    } completion:^(BOOL finished) {
        [self.downView removeFromSuperview];
        [self removeFromSuperview];
        self.downView = nil;
    }];
}

/**
 *  单击手势的隐藏事件
 */
-(void)hideDropDownView:(UITapGestureRecognizer*) gesture {
    CGPoint touchPoint = [gesture locationInView:self];
    if (touchPoint.y > self.frame.size.width * 1.128) {
        
        [self hideDropDownView];
    }
}

@end
