//
//  STMPLoginController.m
//  FLCTMessagePush
//
//  Created by Maple Yin on 2017/11/29.
//  Copyright © 2017年 Maple. All rights reserved.
//

#import "STMPLoginController.h"
#import "STMPLoginTextField.h"
#import "STMPAccountManager.h"


@interface STMPLoginController ()

@property (nonatomic, strong) UIStackView *stackView;
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) STMPLoginTextField *usernameTextField;
@property (nonatomic, strong) STMPLoginTextField *passwordTextField;
@property (nonatomic, strong) UIButton *loginButton;

@property (nonatomic, strong) MASConstraint *stackViewBottomConstraint;

@end

@implementation STMPLoginController

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self setupView];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.usernameTextField becomeFirstResponder];
}


- (void)setupView {
    
    self.view.backgroundColor = STColorHex(@"eeeeee");
    
    self.stackView = [[UIStackView alloc] init];
    self.stackView.axis = UILayoutConstraintAxisVertical;
    self.stackView.alignment = UIStackViewAlignmentCenter;
    self.stackView.distribution = UIStackViewDistributionEqualSpacing;
    
    
    self.iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_logo_round"]];
    
    self.usernameTextField = [[STMPLoginTextField alloc] init];
    self.usernameTextField.placeholder = @"用户名";
    self.usernameTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.usernameTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.usernameTextField.textContentType = UITextContentTypeUsername;
    self.usernameTextField.font = [UIFont systemFontOfSize:12];
    
    self.passwordTextField = [[STMPLoginTextField alloc] init];
    self.passwordTextField.placeholder = @"密码";
    self.passwordTextField.textContentType = UITextContentTypePassword;
    self.passwordTextField.secureTextEntry = YES;
    self.passwordTextField.font = [UIFont systemFontOfSize:12];
    
    self.loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loginButton.layer.cornerRadius = 3;
    [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
    self.loginButton.titleLabel.font = [UIFont systemFontOfSize:14];
    self.loginButton.backgroundColor = [UIColor colorWithRed:0.137 green:0.137 blue:0.137 alpha:1.000];
    [self.loginButton addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];

    
    [self.stackView addArrangedSubview:self.iconView];
    [self.stackView addArrangedSubview:self.usernameTextField];
    [self.stackView addArrangedSubview:self.passwordTextField];
    [self.stackView addArrangedSubview:self.loginButton];
    
    [self.usernameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self.stackView);
        make.height.equalTo(@22);
    }];
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self.stackView);
        make.height.equalTo(self.usernameTextField);
    }];
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self.stackView);
    }];
    
    [self.view addSubview:self.stackView];
    [self.stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view).offset(70);
        make.trailing.equalTo(self.view).offset(-70);
        make.centerY.equalTo(self.view).priorityMedium();
        self.stackViewBottomConstraint = make.bottom.equalTo(self.view).offset(0).priorityHigh();
        make.height.equalTo(@250);
    }];
    
    [self.stackViewBottomConstraint uninstall];
}


#pragma mark - action

- (void)login:(UIButton *)btn {
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = @"正在登录";
    hud.animationType = MBProgressHUDAnimationZoomIn;
    [[STMPAccountManager sharedInstance] loginWithUsername:self.usernameTextField.text password:self.passwordTextField.text completeBlock:^(BOOL success) {
        if (success) {
            hud.mode = MBProgressHUDModeText;
            hud.label.text = @"登录成功";
            [hud hideAnimated:YES afterDelay:1];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }];
}


#pragma mark - UIKeyNotification

- (void)keyboardWillShow:(NSNotification *)notification {
    [self.stackViewBottomConstraint install];
    NSDictionary* info = [notification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    
    self.stackViewBottomConstraint.offset(-kbSize.height-30);
    
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)keyboardWillHide:(NSNotification *)notification {
    [self.stackViewBottomConstraint uninstall];
    
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
}


@end
