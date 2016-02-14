
//
//  MainTableViewCell.m
//  DropDownMenuStudy
//
//  Created by caiqiujun on 16/2/3.
//  Copyright © 2016年 caiqiujun. All rights reserved.
//

#import "MainTableViewCell.h"

@interface MainTableViewCell ()

@end

@implementation MainTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        // 修改选中cell的颜色
        UIView *backView = [[UIView alloc] init];
        backView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
        self.selectedBackgroundView = backView;
    }
    return self;
}




@end
