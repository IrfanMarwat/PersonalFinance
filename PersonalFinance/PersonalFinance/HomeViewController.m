//
//  HomeViewController.m
//  PersonalFinance
//
//  Created by Irfan on 9/10/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import "HomeViewController.h"
#import "PersonalFinance-Swift.h"

@interface HomeViewController () <RegistrationPresentable> {
    // Voilation of SRP ??? NO
    id<ControllerPresenter> registrationPresenter; //dependency: must be injected by external source --> Property Injection
    id<ControllerLoader> dashboardLoader; //dependency: must be injected by external source --> Property Injection
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    [registrationPresenter presentController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setRegistrationPresenter:(id)presenter {
    registrationPresenter = presenter;
}

-(void)setDashboardLoader:(id)loader {
    dashboardLoader = loader;
}

-(UIViewController *)getViewController {
    return self;
}

@end
