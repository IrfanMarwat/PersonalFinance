//
//  RegistrationViewController.m
//  PersonalFinance
//
//  Created by Irfan on 9/10/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import "RegistrationViewController.h"
#import "Account+CoreDataProperties.h"
#import "Account.h"
#import "PersonalFinance-Swift.h"

@interface RegistrationViewController () <TextFieldDelegate> {
    // SRP
    id<AccountStore> _store; // Dependency
    id<ControllerLoader> homeLoader; // Dependency
    Account *_account; // dependency
    id<FieldValidator> registrationFieldValidator; // dependency
    id<AlertHandler> toastHandler; // dependency
}

@end

@implementation RegistrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textFieldAccountName.textFieldDelegate = self;
    self.textFieldAccountNumber.textFieldDelegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setAccount:(Account *)account {
    _account = account;
}

-(void)setStore:(id)store {
    _store = store;
}

-(void)setControllerLoader:(id)loader {
    homeLoader = loader;
}

-(void)setAlertHandler:(id)alertHandler {
    toastHandler = alertHandler;
}

-(void)setValidator:(id)validator {
    registrationFieldValidator = validator;
}

- (IBAction)saveAccount:(id)sender {
    registrationFieldValidator = [[RegistrationFieldValidator alloc] initWithAccountNumber:self.textFieldAccountNumber.text accountName:self.textFieldAccountName.text];
    [self proceedToHome];
}

-(void)proceedToHome {
    if ([self validateFields]) {
        [self saveAccount];
    } else {
        [toastHandler presentAlert:[[ErrorAlert alloc] initWithMessage:registrationFieldValidator.errorMessage]];
    }
}

-(BOOL)validateFields {
    return [registrationFieldValidator validate];
}

-(void)saveAccount {
    _account.number = _textFieldAccountNumber.text;
    _account.name = _textFieldAccountName.text;
    
    [_store createAccount:_account];
    [homeLoader loadController];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch * touch = [touches anyObject];
    if(touch.phase == UITouchPhaseBegan) {
        [self.textFieldAccountName resignFirstResponder];
        [self.textFieldAccountNumber resignFirstResponder];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField isEqual:self.textFieldAccountNumber]) {
        [self.textFieldAccountNumber resignFirstResponder];
        return true;
    }
    registrationFieldValidator = [[RegistrationFieldValidator alloc] initWithAccountNumber:self.textFieldAccountNumber.text accountName:self.textFieldAccountName.text];
    [self proceedToHome];
    return true;
}

- (void)textFieldDidBeginEditing:(UITextField * __nonnull)textField {
    
}
- (void)textFieldDidEndEditing:(UITextField * __nonnull)textField {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
