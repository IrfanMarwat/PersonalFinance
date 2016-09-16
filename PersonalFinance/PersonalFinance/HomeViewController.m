//
//  HomeViewController.m
//  PersonalFinance
//
//  Created by Irfan on 9/10/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import "HomeViewController.h"
#import "PersonalFinance-Swift.h"

@interface HomeViewController () <ControllerPresentable, HomeControllerLoading, TreeHandlerDelegate, HomeTreeHandling> {
    // Voilation of SRP ??? NO
    __weak IBOutlet UIButton *buttonPlus;
    __weak IBOutlet UILabel *labelHeader;
    UINavigationController *_navigationController;
    id<ControllerPresenter> registrationPresenter; //dependency: must be injected by external source --> Property Injection
    id<ControllerLoader> dashboardLoader; //dependency: must be injected by external source --> Property Injection
    TreeHandler *_treeHandler; // dependency
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _navigationController = self.childViewControllers.firstObject;
    [dashboardLoader loadController];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    [registrationPresenter presentController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGRect)getButtonFrame {
    return buttonPlus.frame;
}

-(void)setViewController:(UIViewController *)vc {
    [_navigationController setViewControllers:@[vc] animated:true];
}

-(void)setHeaderTitle:(NSString *)title {
    labelHeader.text = title;
}

-(void)setDashboardLoader:(id)loader {
    dashboardLoader = loader;
}

-(void)setTreeHandler:(id)treeHandler {
    _treeHandler = treeHandler;
}

-(UIViewController *)getViewController {
    return self;
}

#pragma-mark - Tree Button

- (IBAction)plusButtonPressed:(id)sender {
    if (buttonPlus.selected == false) {
        [self expandTree];
    } else {
        [self collapseTree];
    }
}

-(void)expandTree {
    [_treeHandler expandTree];
    buttonPlus.selected = true;
}

-(void)collapseTree {
    [_treeHandler collapseTree];
    buttonPlus.selected = false;
}

// HomeTreeHandling

-(void)setupTreeHandler:(id<TreeFactory>)factory {
    _treeHandler = [[TreeHandler alloc] initWithNodeFactory:factory view:self.view];
    _treeHandler.delegate = self;
}

@end
