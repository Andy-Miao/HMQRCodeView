//
//  StoreCodeView.h
//  InStoreBusiness
//
//  Created by 胡苗 on 14/11/9.
//  Copyright © 2014年 胡苗. All rights reserved.
//

#import <UIKit/UIKit.h>

#define     WhiteColor       [UIColor whiteColor]
#define     GrayColor        [UIColor grayColor]
#define     BlackColor       [UIColor blackColor]

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

//1080图片缩放比例
#define SCALE_IMG [UIScreen mainScreen].bounds.size.width/1080

@interface StoreCodeView : UIView

@property (nonatomic, strong) UIButton * saveBtn;
@property (nonatomic, strong) UIImageView * portraitImg;
@property (nonatomic, strong) UILabel * nicknameLab;
@property (nonatomic, strong) UILabel * cityLab;
@property (nonatomic, strong) UIImageView * qrCodeImg;
@property (nonatomic, strong)  UIImageView * inStoreLogo;
@end
