//
//  BottomView.m
//  DropDownMenuStudy
//
//  Created by caiqiujun on 16/2/3.
//  Copyright © 2016年 caiqiujun. All rights reserved.
//

#import "BottomView.h"

@interface BottomView ()

@end

@implementation BottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, frame.size.height * 0.2, frame.size.width, frame.size.height * 0.4)];
        imageView.image = [UIImage imageNamed:@"type_dotdotdot.png"];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:imageView];
        [self setShadow];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
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
    CGFloat components[8] = {1.0, 1.0, 1.0, 1.0,
    0.85, 0.85, 0.85, 1.0};
    CGFloat locations[3] = {0.0, 1.0};
    
    CGGradientRef gradient= CGGradientCreateWithColorComponents(colorSpace, components, locations, 2);
    //渐变区域裁剪
    //    CGContextClipToRect(context, CGRectMake(0, 360, 200, 100));
    CGRect rects[1] = {CGRectMake(0, cellH * 0.8, screenWidth, cellH * 0.2)};
    CGContextClipToRects(context, rects, 1);
    //绘制渐变
    CGContextDrawLinearGradient(context, gradient, CGPointMake(screenWidth / 2, cellH * 0.8), CGPointMake(screenWidth / 2, cellH), kCGGradientDrawsAfterEndLocation);
    //释放对象
    CGColorSpaceRelease(colorSpace);
    CGGradientRelease(gradient);
}

/**
 *  设置阴影效果
 */
- (void)setShadow {
    // 阴影颜色
    self.layer.shadowColor = [[UIColor grayColor] CGColor];
    // 阴影偏移
    self.layer.shadowOffset = CGSizeMake(0, -0.5);
    // 阴影不透明度
    self.layer.shadowOpacity = 0.2;
    // 阴影半径
    self.layer.shadowRadius = 0.5;
}

@end
