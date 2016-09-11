//
//  RegistrationViewController.h
//  PersonalFinance
//
//  Created by Irfan on 9/10/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Account;

@interface RegistrationViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textFieldAccountNumber;
@property (weak, nonatomic) IBOutlet UITextField *textFieldAccountName;

-(void)setAccount:(Account *)account;
-(void)setStore:(id)store;
-(void)setControllerLoader:(id)loader;

@end
