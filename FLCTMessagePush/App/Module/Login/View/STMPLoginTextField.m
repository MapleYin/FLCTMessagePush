//
//  STMPLoginTextField.m
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/11/30.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "STMPLoginTextField.h"

@interface STMPLoginTextField()

@property (nonatomic, strong) UIView *bottomLine;

@end

@implementation STMPLoginTextField

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    self.tintColor = STColorHex(@"fb8180");
    
    _bottomLine = [[UIView alloc] init];
    _bottomLine.backgroundColor = STColorHex(@"fb8180");
    
    [self addSubview:_bottomLine];
    [_bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.leading.trailing.equalTo(self);
        make.height.equalTo(@1);
    }];
}



@end
