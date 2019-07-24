//
//  VCMyInfoQrCode.m
//  InStoreBusiness
//
//  Created by 胡苗 on 2015/1/3.
//  Copyright © 2015年 胡苗. All rights reserved.
//



#import "VCMyInfoQrCode.h"
#import "StoreCodeView.h"
#import <CoreImage/CoreImage.h>

@interface VCMyInfoQrCode (){
    
    StoreCodeView *_qrCodeView;
}

@end

@implementation VCMyInfoQrCode

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self addContentView];
}



-(void)addContentView{
    
    self.view.backgroundColor = WhiteColor;
    
    _qrCodeView = [[StoreCodeView alloc]initWithFrame:CGRectMake(0, 0, 900*SCALE_IMG, 1000*SCALE_IMG)];
    _qrCodeView.center = CGPointMake(SCREEN_WIDTH/2, 780*SCALE_IMG);
//    [_qrCodeView.portraitImg sd_setImageWithURL:[NSURL URLWithString:@"icon_choose_pay"] placeholderImage:nil];
//    [_qrCodeView.inStoreLogo sd_setImageWithURL:[NSURL URLWithString:@"icon_choose_pay"] placeholderImage:nil];
    [_qrCodeView.portraitImg setImage:[UIImage imageNamed:@"andy"]];
    [_qrCodeView.inStoreLogo setImage:[UIImage imageNamed:@"andy"]];
    _qrCodeView.nicknameLab.text = @"刘德华";
    _qrCodeView.cityLab.text = [NSString stringWithFormat:@"%@",@"城市"];
    [_qrCodeView.saveBtn addTarget:self action:@selector(saveButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_qrCodeView.saveBtn setTitle:@"保存相册" forState:UIControlStateNormal];
    [_qrCodeView.saveBtn setTitleColor:GrayColor forState:UIControlStateNormal];
    [self.view addSubview:_qrCodeView];
    
    [self erweima];
}

-(void)erweima
{
    CIFilter *filter=[CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    NSData *data=[@"123456" dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKey:@"inputMessage"];
    CIImage *outputImage=[filter outputImage];
    
    _qrCodeView.qrCodeImg.image=[self createNonInterpolatedUIImageFormCIImage:outputImage withSize:640*SCALE_IMG];
}

//改变二维码大小
- (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size {
    
    CGRect extent = CGRectIntegral(image.extent);
    
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    // 创建bitmap;
    
    size_t width = CGRectGetWidth(extent) * scale;
    
    size_t height = CGRectGetHeight(extent) * scale;
    
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    
    CIContext *context = [CIContext contextWithOptions:nil];
    
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    
    CGContextScaleCTM(bitmapRef, scale, scale);
    
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 保存bitmap到图片
    
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    
    CGContextRelease(bitmapRef);
    
    CGImageRelease(bitmapImage);
    
    return [UIImage imageWithCGImage:scaledImage];
}

-(void)saveButtonAction:(UIButton *)sender{
    
    UIGraphicsBeginImageContextWithOptions(_qrCodeView.bounds.size, YES, 1);
    [_qrCodeView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIImageWriteToSavedPhotosAlbum(img, self, nil, nil);
    UIGraphicsEndImageContext();
    
    NSLog(@"保存成功");
}
@end
