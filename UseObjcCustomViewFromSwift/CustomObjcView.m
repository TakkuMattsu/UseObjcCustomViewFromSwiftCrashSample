//
//  CustomObjcView.m
//  UseObjcCustomViewFromSwift
//
//  Created by TakkuMattsu on 2018/03/13.
//  Copyright © 2018年 TakkuMattsu. All rights reserved.
//

#import "CustomObjcView.h"

@interface CustomObjcView()

@property (nonatomic) UIButton *btn;

@end

@implementation CustomObjcView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    _btn = [UIButton buttonWithType:UIButtonTypeCustom]; {
        _btn.translatesAutoresizingMaskIntoConstraints = NO;
        [_btn setTitle:@"テストボタン" forState:UIControlStateNormal];
        [_btn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        [_btn setBackgroundImage:[self createImageFromUIColor:UIColor.cyanColor] forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventTouchUpInside];
        [_btn sizeToFit];
        [self addSubview:_btn];
        NSLayoutConstraint *constCenterX = [NSLayoutConstraint constraintWithItem:_btn attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
        NSLayoutConstraint *constCenterY = [NSLayoutConstraint constraintWithItem:_btn attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
        [self addConstraints:@[constCenterX, constCenterY]];
    }
    self.backgroundColor = [UIColor yellowColor];
}

- (void)tapped:(id)sender {
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(didTapped:)]){
            [self.delegate didTapped:self];
        }
    }
}

// Thanks
// https://qiita.com/akatsuki174/items/c0b8b5126b6c12f62001
- (UIImage *)createImageFromUIColor:(UIColor *)color  {
    // 1x1のbitmapを作成
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    // bitmapを塗りつぶし
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    // UIImageに変換
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
