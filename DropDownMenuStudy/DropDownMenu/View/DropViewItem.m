//
//  DropViewItem.m
//  DropDownMenuStudy
//
//  Created by caiqiujun on 16/2/2.
//  Copyright © 2016年 caiqiujun. All rights reserved.
//

#import "DropViewItem.h"

@interface DropViewItem ()
@property (nonatomic, strong)UILabel *labelName;
@end

@implementation DropViewItem

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}



- (void)initTextLabl {
    self.labelName = [[UILabel alloc] init];
    self.labelName.frame = self.frame;
    self.labelName.text = @"";
    // 居中对齐
    self.labelName.textAlignment = NSTextAlignmentCenter;
    self.labelName.textColor = [UIColor colorWithWhite:0.2 alpha:0.8];
    self.labelName.font = [UIFont systemFontOfSize:12 weight:5];
    [self addSubview:self.labelName];
}

@end
