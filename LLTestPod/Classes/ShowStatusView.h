//
//  ShowStatusView.h
//  ShopBliBao
//
//  Created by wanglulu on 16/6/21.
//  Copyright © 2016年 wanglulu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowStatusView : UIView
@property(nonatomic,strong)UIButton * loadBut;
@property(nonatomic,strong)UIImageView * loadImage;
/**
 *  展示加载动画
 */
-(void)showLoadImage;

/**
 * 设置空数据按钮状态
 */
-(void)setEmptyEnable;

/**
 *  展示空数据动画
 */
- (void)showEmptyFullImage:(UIView *)baseview;
-(void)showEmptyFullImageWith:(UIView*)baseview;

-(void)showEmptyImageWith:(UIView*)baseaView;
-(void)showEmptyImageFreedom:(UIView*)view WithFrame:(CGRect)frame;
- (void)showEmptyFree:(UIView *)view WithFrame:(CGRect)frame;
//适用于信用借还的提示
-(void)creditBorrowOrRepayShowEmptyImageFreedom:(UIView*)view WithFrame:(CGRect)frame;

/**
 *  展示断网动画
 */
-(void)showNoNetImage:(UIView*)view;
-(void)showNoNetImageFullView:(UIView*)view;

-(void)showNoNetImageFullView2:(UIView*)view;
-(void)showNoNetImageFreedom:(UIView*)view WithFrame:(CGRect)frame;
-(void)stopLoad;
@end
