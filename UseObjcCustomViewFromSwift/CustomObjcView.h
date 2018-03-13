//
//  CustomObjView.h
//  UseObjcCustomViewFromSwift
//
//  Created by TakkuMattsu on 2018/03/13.
//  Copyright © 2018年 TakkuMattsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomObjcView;

@protocol CustomObjcViewDelegate <NSObject>

- (void)didTapped:(CustomObjcView *)customView;

@end

IB_DESIGNABLE
@interface CustomObjcView : UIView

@property (nonatomic, weak) id<CustomObjcViewDelegate> delegate;

@end
