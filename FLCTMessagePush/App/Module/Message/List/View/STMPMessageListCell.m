//
//  STMPMessageListCell.m
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/11/21.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "STMPMessageListCell.h"
#import "STMPMessageModel.h"

@interface STMPMessageListCell()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;

@end

@implementation STMPMessageListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    _titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_titleLabel];
    
    
    _detailLabel = [[UILabel alloc] init];
    _detailLabel.textColor = STColorHex(@"aeaeae");
    _detailLabel.numberOfLines = 0;
    [self.contentView addSubview:_detailLabel];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView).offset(12);
        make.top.equalTo(self.contentView).offset(12);
        make.trailing.equalTo(self.contentView).offset(-12);
    }];
    
    [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(_titleLabel);
        make.top.equalTo(_titleLabel.mas_bottom).offset(12);
        make.bottom.equalTo(self.contentView).offset(-12);
    }];
    
}

- (void)setupWithModel:(STMPMessageModel *)model {
    self.titleLabel.text = model.from;
    self.detailLabel.text = model.content;
}

@end
