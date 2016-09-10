//
//  RegistrationViewController.m
//  PersonalFinance
//
//  Created by Irfan on 9/10/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import "RegistrationViewController.h"
#import "PersonalFinance-Swift.h"

@interface RegistrationViewController () {
    // SRP
    id<AccountStore> _store; // Dependency
    id<ControllerLoader> homeLoader; // Dependency
}

@end

@implementation RegistrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setStore:(id)store {
    _store = store;
}

-(void)setControllerLoader:(id)loader {
    homeLoader = loader;
}

- (IBAction)saveAccount:(id)sender {
    [_store createAccount];
    [homeLoader loadController];
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
