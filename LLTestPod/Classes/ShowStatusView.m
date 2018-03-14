//
//  ShowStatusView.m
//  ShopBliBao
//
//  Created by wanglulu on 16/6/21.
//  Copyright © 2016年 wanglulu. All rights reserved.
//

#import "ShowStatusView.h"

@interface ShowStatusView ()
@property(nonatomic,strong)NSTimer * timer;
@property(nonatomic,strong)UILabel * messageLabel;
@end
int number1 = 0;
@implementation ShowStatusView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self addViewsWithImage];
    self.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.453];
    return self;
    
}


-(void)addViewsWithImage{
    self.loadImage = [UIImageView new];
    [self insertSubview:self.loadImage atIndex:1000];
    [self.loadImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.centerY.equalTo(self.mas_centerY).offset(-20);
        make.size.mas_equalTo(CGSizeMake(150, 150));
        
    }];
    self.backgroundColor = [UIColor redColor];
    
    self.messageLabel = [UILabel new];
    [self addSubview:self.messageLabel];
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.top.equalTo(self.loadImage.mas_bottom).offset(0);
        make.size.mas_equalTo(CGSizeMake(200, 20));
    }];
    self.messageLabel.textAlignment = NSTextAlignmentCenter;
    self.messageLabel.font = [UIFont systemFontOfSize:14];
    
    
    self.loadBut=  [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.loadBut];
    [self.loadBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.top.equalTo(self.messageLabel.mas_bottom).offset(0);
        make.size.mas_equalTo(CGSizeMake(200, 20));
    }];
    self.loadBut.titleLabel.font = [UIFont systemFontOfSize:17];
    [self.loadBut setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
   
}


-(void)showLoadImage{
    [_loadImage stopAnimating];
    [self removeFromSuperview];
    _messageLabel.textColor = [UIColor whiteColor];
    self.loadBut.hidden = YES;
    [[UIApplication sharedApplication].windows[0] addSubview:self];
    self.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.453];
    self.frame = [UIScreen mainScreen].bounds;
    _loadImage.animationImages = @[
                                   [UIImage imageNamed:@"load_01"],
                                   [UIImage imageNamed:@"load_02"],
                                   
                                   
                                   ];
    _loadImage.animationDuration = 0.5f;
    _loadImage.animationRepeatCount = MAXFLOAT;
    [_loadImage startAnimating];
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:.5 target:self selector:@selector(loadButChangeTitle) userInfo:nil repeats:YES];
        [_timer fire];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(20 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self stopLoad];
    });
    
    
    
    
}


-(void)loadButChangeTitle{
    NSArray * titleAry = @[@"数据正在加载中.",@"数据正在加载中..",@"数据正在加载中..."];
    
    self.messageLabel.text =titleAry[number1%3];
    number1++;
}


-(void)showEmptyImageWith:(UIView*)baseaView{
    _loadBut.hidden = NO;
    _messageLabel.textColor = [UIColor blackColor];

   [_timer invalidate];
    _timer = nil;
    [_loadImage stopAnimating];
//
    //    [_timer invalidate];
   
    self.backgroundColor = [UIColor whiteColor];
//    if (baseaView.width>SCREEN_WIDTH) {
//    self.frame = CGRectMake(0, 0,SCREEN_WIDTH, baseaView.frame.size.height);
//    }else{
//        }
    self.frame = CGRectMake(0, 0, baseaView.frame.size.width, baseaView.frame.size.height);

  
//    _loadImage.animationImages = @[
//                                   [UIImage imageNamed:@"NO_data"],
//                                                                      ];
    _loadImage.image = [UIImage imageNamed:@"NO_data"];
//    _loadImage.animationDuration = 1.0f;
//    //    _loadImage.animationRepeatCount = MAXFLOAT;
//    [_loadImage startAnimating];
    self.messageLabel.text = @"没有网络数据哦!";
    [self.loadBut setTitle:@"刷新" forState: UIControlStateNormal];
    [baseaView addSubview:self];
     [baseaView bringSubviewToFront:self];
    
}

//未绑定付款码
- (void)showEmptyFullImage:(UIView *)baseview{
    _loadBut.hidden = NO;
    _messageLabel.textColor = [UIColor blackColor];
    
    [_timer invalidate];
    _timer = nil;
    [_loadImage stopAnimating];
    
    self.backgroundColor = [UIColor whiteColor];
    self.frame = CGRectMake(0, kNaviHeight, SCREEN_WIDTH, (SCREEN_HEIGHT) - (kNaviHeight) + (kTabbarSafeAreaHeight));
    _loadImage.image = [UIImage imageNamed:@"NO_data"];
    self.messageLabel.text = @"您还未绑定付款码~";
//    [self.loadBut setTitle:@"刷新" forState: UIControlStateNormal];
    
    [baseview addSubview:self];
}


-(void)showEmptyFullImageWith:(UIView*)baseview{
    _loadBut.hidden = NO;
    _messageLabel.textColor = [UIColor blackColor];

    [_timer invalidate];
    _timer = nil;
    [_loadImage stopAnimating];
    
    self.backgroundColor = [UIColor whiteColor];
    self.frame = CGRectMake(0, kNaviHeight, SCREEN_WIDTH, (SCREEN_HEIGHT) - (kNaviHeight) + (kTabbarSafeAreaHeight));
//    _loadImage.animationImages = @[
//                                   [UIImage imageNamed:@"NO_data"],
//                                   
//                                   ];
     _loadImage.image = [UIImage imageNamed:@"NO_data"];
//    _loadImage.animationDuration = 1.0f;
//    _loadImage.animationRepeatCount = MAXFLOAT;
//    [_loadImage startAnimating];
    self.messageLabel.text = @"没有网络数据哦!";
    [self.loadBut setTitle:@"刷新" forState: UIControlStateNormal];
    
    [baseview addSubview:self];
}


//在线订单无数据
- (void)showEmptyFree:(UIView *)view WithFrame:(CGRect)frame{
    _loadBut.hidden = NO;
    _messageLabel.textColor = [UIColor blackColor];
    
    [_timer invalidate];
    _timer = nil;
    [_loadImage stopAnimating];
    
    self.backgroundColor = [UIColor whiteColor];
    self.frame = frame;
    
    _loadImage.image = [UIImage imageNamed:@"NO_data"];
    self.messageLabel.text = @"暂无订单信息哦~";
    [self.loadBut setTitle:@"刷新" forState: UIControlStateNormal];
    
    [view addSubview:self];
    

}

-(void)showEmptyImageFreedom:(UIView*)view WithFrame:(CGRect)frame{
    _loadBut.hidden = NO;
    _messageLabel.textColor = [UIColor blackColor];
    
    [_timer invalidate];
    _timer = nil;
    [_loadImage stopAnimating];
    
    self.backgroundColor = [UIColor whiteColor];
    self.frame = frame;
    
    _loadImage.image = [UIImage imageNamed:@"NO_data"];
    self.messageLabel.text = @"没有网络数据哦!";
    [self.loadBut setTitle:@"刷新" forState: UIControlStateNormal];
    
    [view addSubview:self];
  
    
}
-(void)setEmptyEnable{
    [self.loadBut setTitle:@"没有网络数据哦!" forState: UIControlStateNormal];
    self.loadBut.enabled = NO;
    
}

-(void)creditBorrowOrRepayShowEmptyImageFreedom:(UIView*)view WithFrame:(CGRect)frame{
    
    _loadBut.hidden = YES;
    _messageLabel.textColor = [ColorChange hexStringToColor:@"#808080" alpha:1];
    
    [_timer invalidate];
    _timer = nil;
    [_loadImage stopAnimating];
    
    self.backgroundColor = [UIColor whiteColor];
    self.frame = frame;
    
    [_loadImage mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.centerY.equalTo(self.mas_centerY).offset(-20);
        make.size.mas_equalTo(CGSizeMake(74.f*SCREEN_WIDTH/375.f, 84.f*(SCREEN_HEIGHT)/667.f));
        
    }];
    [_messageLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.top.equalTo(self.loadImage.mas_bottom).offset(15);
        make.size.mas_equalTo(CGSizeMake(200, 20));
    }];

    _loadImage.image = [UIImage imageNamed:@"CreditNo_data"];
    _messageLabel.text = @"暂时没有数据哦～";
//    [self.loadBut setTitle:@"刷新" forState: UIControlStateNormal];
    
    [view addSubview:self];
    
}


-(void)showNoNetImage:(UIView*)view{
    _loadBut.hidden = NO;
    _messageLabel.textColor = [UIColor blackColor];

    [_timer invalidate];
    _timer = nil;
    [_loadImage stopAnimating];
   
    self.backgroundColor = [UIColor whiteColor];
    self.frame = CGRectMake(0, kNaviHeight, SCREEN_WIDTH, (SCREEN_HEIGHT) - (kNaviHeight) + (kTabbarSafeAreaHeight));
      _loadImage.image = [UIImage imageNamed:@"Loading_faild"];    
    self.messageLabel.text = @"糟糕,断网了o(︶︿︶)o";
    [self.loadBut setTitle:@"重试" forState: UIControlStateNormal];
    
     [view addSubview:self];
    
}

-(void)showNoNetImageFreedom:(UIView*)view WithFrame:(CGRect)frame{
    _loadBut.hidden = NO;
    _messageLabel.textColor = [UIColor blackColor];
    
    [_timer invalidate];
    _timer = nil;
    [_loadImage stopAnimating];
    
    self.backgroundColor = [UIColor whiteColor];
    self.frame = frame;
    _loadImage.image = [UIImage imageNamed:@"Loading_faild"];
    self.messageLabel.text = @"糟糕,断网了o(︶︿︶)o";
    [self.loadBut setTitle:@"重试" forState: UIControlStateNormal];
    [view addSubview:self];
    [view bringSubviewToFront:self];
    
    
    
}

-(void)showNoNetImageFullView:(UIView*)view{
    _loadBut.hidden = NO;
    _messageLabel.textColor = [UIColor blackColor];

    [_timer invalidate];
    _timer = nil;
        [_loadImage stopAnimating];
    
    _loadBut.enabled = YES;
    //    [_timer invalidate];
    self.backgroundColor = [UIColor whiteColor];
    self.frame = CGRectMake(0, 0,SCREEN_WIDTH, SCREEN_HEIGHT);
    
    _loadImage.image = [UIImage imageNamed:@"Loading_faild"];

//    _loadImage.animationDuration = 1.0f;
//    _loadImage.animationRepeatCount = MAXFLOAT;
//    [_loadImage startAnimating];
    self.messageLabel.text = @"糟糕,断网了o(︶︿︶)o";

    [self.loadBut setTitle:@"重试" forState: UIControlStateNormal];
    [view addSubview:self];
    
    
}



-(void)showNoNetImageFullView2:(UIView*)view{
    _loadBut.hidden = NO;
    _messageLabel.textColor = [UIColor blackColor];


     [_timer invalidate];
    _timer = nil;
    //    [_loadImage stopAnimating];
   
    _loadBut.enabled = YES;
    //    [_timer invalidate];
    self.backgroundColor = [UIColor whiteColor];
    self.frame = CGRectMake(0, 114, view.frame.size.width, view.frame.size.height-114);
//    _loadImage.animationImages = @[
//                                   [UIImage imageNamed:@"Loading_faild"],
//                                                                     ];
      _loadImage.image = [UIImage imageNamed:@"Loading_faild"];
//    _loadImage.animationDuration = 1.0f;
//    _loadImage.animationRepeatCount = MAXFLOAT;
//    [_loadImage startAnimating];
    self.messageLabel.text = @"糟糕,断网了o(︶︿︶)o";

    [self.loadBut setTitle:@"重试" forState: UIControlStateNormal];
     [view addSubview:self];
}


-(void)stopLoad{
    [_timer invalidate];
    _timer = nil;
    [self removeFromSuperview];
    
    
    
}



@end
