//
//  StoreCodeView.m
//  InStoreBusiness
//
//  Created by 胡苗 on 14/11/9.
//  Copyright © 2014年 胡苗. All rights reserved.
//

#import "StoreCodeView.h"
#import "Masonry.h"
@implementation StoreCodeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = WhiteColor;
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;

        _portraitImg = [UIImageView new];
        _portraitImg.layer.masksToBounds = YES;
        _portraitImg.layer.cornerRadius = 2;
        [self addSubview:_portraitImg];
        [_portraitImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(15);
            make.left.equalTo(self).offset(15);
            make.size.mas_equalTo(CGSizeMake(35, 35));
        }];
        
        _nicknameLab = [UILabel new];
        _nicknameLab.textColor = BlackColor;
        _nicknameLab.font = [UIFont systemFontOfSize:15];
        [self addSubview:_nicknameLab];
        WS(weakSelf)
        [_nicknameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.portraitImg.mas_right).offset(10);
            make.top.equalTo(self).offset(15);
            make.size.mas_equalTo(CGSizeMake(200, 17));
        }];
        
        _cityLab = [UILabel new];
        _cityLab.textColor = BlackColor;
        _cityLab.font = [UIFont systemFontOfSize:13];
        [self addSubview:_cityLab];
        [_cityLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.portraitImg.mas_right).offset(10);
            make.top.equalTo(weakSelf.nicknameLab.mas_bottom).offset(5);
            make.size.mas_equalTo(CGSizeMake(200, 13));
        }];
        
        _qrCodeImg = [UIImageView new];
        [self addSubview:_qrCodeImg];
        [_qrCodeImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(weakSelf.portraitImg.mas_bottom).offset(20);
            make.size.mas_equalTo(CGSizeMake(640*SCALE_IMG, 640*SCALE_IMG));
        }];
        
        UIView * logoBgView = [UIView new];
        logoBgView.backgroundColor = WhiteColor;
        logoBgView.layer.cornerRadius = 5;
        logoBgView.layer.masksToBounds = YES;
        [self addSubview:logoBgView];
        [logoBgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(weakSelf.qrCodeImg);
            make.size.mas_equalTo(CGSizeMake(165*SCALE_IMG, 165*SCALE_IMG));
        }];
        
        _inStoreLogo = [UIImageView new];
        _inStoreLogo.layer.cornerRadius = 5;
        _inStoreLogo.layer.masksToBounds = YES;
        [self addSubview:_inStoreLogo];
        [_inStoreLogo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(weakSelf.qrCodeImg);
            make.size.mas_equalTo(CGSizeMake(155*SCALE_IMG, 155*SCALE_IMG));
        }];
        
        _saveBtn = [UIButton new];
        [_saveBtn setTitle:@"保存到手机" forState:UIControlStateNormal];
        [_saveBtn setTitleColor:BlackColor forState:UIControlStateNormal];
        _saveBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_saveBtn];
        [_saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.centerY.equalTo(self.mas_bottom).offset(-80*SCALE_IMG);
            make.size.mas_equalTo(CGSizeMake(200, 30));
        }];
        
    }
    return self;
}


@end
