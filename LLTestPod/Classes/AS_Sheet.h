//
//  AS_Sheet.h
//  ASActionSheet
//
//  Copyright © 2016年 wanglulu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AS_Sheet : UIView

@property (nonatomic, copy) void (^Click)(NSInteger clickIndex);
@property (nonatomic, strong) UIView *bgkView;
- (instancetype)initWithFrame:(CGRect)frame titleArr:(NSArray *)titleArr;
- (void)hiddenSheet;

@end
