
/**
 *                    .::::.
 *                  .::::::::.
 *                 :::::::::::  FUCK YOU
 *             ..:::::::::::'
 *           '::::::::::::'
 *             .::::::::::
 *        '::::::::::::::..
 *             ..::::::::::::.
 *           ``::::::::::::::::
 *            ::::``:::::::::'        .:::.
 *           ::::'   ':::::'       .::::::::.
 *         .::::'      ::::     .:::::::'::::.
 *        .:::'       :::::  .:::::::::' ':::::.
 *       .::'        :::::.:::::::::'      ':::::.
 *      .::'         ::::::::::::::'         ``::::.
 *  ...:::           ::::::::::::'              ``::.
 * ```` ':.          ':::::::::'                  ::::..
 *                    '.:::::'                    ':'````..
 */
//  BankCardcCell.m
//  银行卡列表Demo
//
//  Created by ZSMAC on 2017/10/26.
//  Copyright © 2017年 张帅. All rights reserved.
//

#import "BankCardcCell.h"
#import "UIView+GoodView.h"
@implementation BankCardcCell {
    UIImageView * _bankImageCion;
    UILabel * _bankNameLabel;
    UILabel * _accountLabel;
     UIImageView * _masterLabelBackImageView;
    UILabel * _masterLabel;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self=[super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 8;
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOffset = CGSizeMake(0, 0);
        self.layer.shadowRadius = 5.0f;
        self.layer.shadowOpacity = 1.f;
        self.layer.masksToBounds = NO;
        [self uiConfigue];
    }
    return self;
}
- (void)uiConfigue {
   _bankImageCion = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 40, 40)];
    _bankImageCion.backgroundColor=[UIColor colorWithRed: arc4random_uniform(256)/255.0f green: arc4random_uniform(256)/255.0f blue: arc4random_uniform(256)/255.0f alpha:1];
    _bankImageCion.image=[UIImage imageNamed:@""];
    _bankImageCion.layer.cornerRadius=_bankImageCion.width/2;
    _bankImageCion.layer.masksToBounds=YES;
    [self.contentView addSubview:_bankImageCion];
    
    _bankNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(_bankImageCion.right+15, 18, 200, 40)];
    _bankNameLabel.font=[UIFont systemFontOfSize:18];
    _bankNameLabel.textColor=[UIColor whiteColor];
    [self.contentView addSubview:_bankNameLabel];
    
    
    _accountLabel = [[UILabel alloc] initWithFrame:CGRectMake(_bankImageCion.right+15, _bankNameLabel.bottom+3, 200, 40)];
    _accountLabel.font=[UIFont systemFontOfSize:18];
    _accountLabel.textColor=[UIColor whiteColor];
    [self.contentView addSubview:_accountLabel];
    
    
    _masterLabelBackImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.width-60, 17, 60, 30)];
    _masterLabelBackImageView.image=[UIImage imageNamed:@"Rectangle_NameBg"];
    [self.contentView addSubview:_masterLabelBackImageView];
    
    _masterLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.width-_masterLabelBackImageView.width, 17, _masterLabelBackImageView.width, 30)];
    _masterLabel.font=[UIFont systemFontOfSize:14];
    _masterLabel.textColor=[UIColor blackColor];
    _masterLabel.textAlignment=NSTextAlignmentCenter;
    [self.contentView addSubview:_masterLabel];
    
}

- (void)setUserName:(NSString *)userName {
    _userName=userName;
    _masterLabel.text=_userName;
}
- (void)setBankName:(NSString *)bankName {
    _bankName=bankName;
    _bankNameLabel.text=_bankName;
}
- (void)setAccount:(NSString *)account {
    _account=account;
    _accountLabel.text=_account;
}


@end

