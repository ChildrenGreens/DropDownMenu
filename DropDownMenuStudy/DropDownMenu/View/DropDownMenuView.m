//
//  DropDownMenuView.m
//  DropDownMenuStudy
//
//  Created by caiqiujun on 16/2/2.
//  Copyright © 2016年 caiqiujun. All rights reserved.
//

#import "DropDownMenuView.h"
#import "DropDownView.h"

@interface DropDownMenuView ()
@property (nonatomic, strong) DropDownView *dropDownView;

@end

@implementation DropDownMenuView

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 高度为屏幕宽度的0.11
        CGRect frame = [[UIScreen mainScreen] bounds];
        CGSize size = frame.size;
        CGFloat screenWidth = size.width;
        CGFloat screenHeight = size.height;
        
        self.frame = CGRectMake(0, 64, screenWidth, screenWidth * 0.115);
        self.backgroundColor = [UIColor whiteColor];
        // 设置阴影效果
        [self setShadow];   
        // 添加手势
        [self setTapGesture];
        
    }
    return self;
}


/**
 *  设置阴影效果
 */
- (void)setShadow {
    // 阴影颜色
    self.layer.shadowColor = [[UIColor grayColor] CGColor];
    // 阴影偏移
    self.layer.shadowOffset = CGSizeMake(1, 1);
    // 阴影不透明度
    self.layer.shadowOpacity = 0.1;
    // 阴影半径
    self.layer.shadowRadius = 0.5;
}

/**
 *  添加手势效果
 */
- (void)setTapGesture {
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showOrHideMenu:)];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:gesture];
}

/**
 *  手势监听
 */
- (void)showOrHideMenu:(UITapGestureRecognizer *)gesture {
    // 获取单击事件所在的点
    CGPoint touchPoint = [gesture locationInView:self];
    
    NSUInteger touchNo = (int)(touchPoint.x / (self.frame.size.width / 3));
    UIViewController *thisVC = [self viewController];
    // 获取当前视图下所有的子控件
    NSArray *views = thisVC.view.subviews;
    
    
    if (touchNo == 0) {
        // 遍历
        for (UIView *view in views) {
            if ([view isKindOfClass:[DropDownView class]]) {
                // 隐藏视图
                [self.dropDownView hideDropDownView];
                return;
            }
        }
        
        self.dropDownView = [[DropDownView alloc] initWithFrame:CGRectMake(0, self.frame.size.width * 0.115 + 64, self.frame.size.width, [UIScreen mainScreen].bounds.size.height - self.frame.size.width * 0.115 - 64)];
        [thisVC.view addSubview:self.dropDownView];
    }
    
    [thisVC.view bringSubviewToFront:self];
    
}


-(void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self drawRect:rect gradient:ctx];
}

#pragma mark 线性渐变
- (void)drawRect:(CGRect)rect gradient:(CGContextRef)context
{
    CGSize size = rect.size;
    CGFloat screenWidth = size.width;
    CGFloat cellH = size.height;
    //步骤：
    /*
     一  创建颜色空间
     二  创建渐变
     三  设置裁剪区域
     四  绘制渐变
     五  释放对象
     */
    //绘制渐变
    
    //在计算机设置中，直接选择rgb即可，其他颜色空间暂时不用考虑。
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    //1.创建渐变
    /*
     1.CGColorSpaceRef space : 颜色空间 rgb
     2.const CGFloat *components ： 数组 每四个一组 表示一个颜色 ｛r,g,b,a ,r,g,b,a｝
     3.const CGFloat *locations:表示渐变的开始位置
     
     */
    CGFloat components[12] = {1.0,1.0,1.0,1.0,
                                0.8,0.8,0.8,1.0,
                                1.0,1.0,1.0,1.0};
    CGFloat locations[3] = {0.0,0.5,1.0};
    
    CGGradientRef gradient= CGGradientCreateWithColorComponents(colorSpace, components, locations, 3);
    //渐变区域裁剪
    //    CGContextClipToRect(context, CGRectMake(0, 360, 200, 100));
    CGRect rects[2] = {CGRectMake(screenWidth / 3, 0, 0.8, cellH),CGRectMake(screenWidth / 3 * 2, 0, 0.8, cellH)};
    CGContextClipToRects(context, rects, 2);
    //绘制渐变
    CGContextDrawLinearGradient(context, gradient, CGPointMake(screenWidth / 2, 0.0), CGPointMake(screenWidth / 2, cellH), kCGGradientDrawsAfterEndLocation);
    //释放对象
    CGColorSpaceRelease(colorSpace);
    CGGradientRelease(gradient);
}

/**
 *  获取视图所在的ViewController
 */
- (UIViewController *)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}


@end
