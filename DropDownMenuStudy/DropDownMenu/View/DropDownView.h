//
//  DropDownView.h
//  DropDownMenuStudy
//
//  Created by caiqiujun on 16/2/3.
//  Copyright © 2016年 caiqiujun. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol DropDownViewDelegate <NSObject>

- (void)selectRowAtIndexPath:(NSIndexPath *)indexPath;

@end


@interface DropDownView : UIView

/// 主选项卡
@property (nonatomic, strong)UITableView *mainTableView;

@property (nonatomic, weak) id <DropDownViewDelegate> delegate;

-(void)hideDropDownView;

- (void)setDefualtSelectedWithRow:(NSUInteger)selectedRow;

@end
