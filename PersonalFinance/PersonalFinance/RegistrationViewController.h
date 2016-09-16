//
//  RegistrationViewController.h
//  PersonalFinance
//
//  Created by Irfan on 9/10/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Account;
@class CharacterTextField;
@class AccountTextField;

@interface RegistrationViewController : UIViewController

@property (weak, nonatomic) IBOutlet AccountTextField *textFieldAccountNumber;
@property (weak, nonatomic) IBOutlet CharacterTextField *textFieldAccountName;

-(void)setAccount:(Account *)account;
-(void)setStore:(id)store;
-(void)setControllerLoader:(id)loader;
-(void)setAlertHandler:(id)alertHandler;
-(void)setValidator:(id)validator;

-(void)proceedToHome;

@end
