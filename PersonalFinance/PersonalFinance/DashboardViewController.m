//
//  DashboardViewController.m
//  PersonalFinance
//
//  Created by Irfan on 9/10/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import "DashboardViewController.h"
#import "Income.h"
#import "Expense.h"
#import "DashboardDatasource.h"
#import "PersonalFinance-Swift.h"

@protocol AutoUpdatingStore <NSObject>

-(void)updateStore;

@end

@interface DashboardViewController ()<TreeButtonsProtocol, DashboardFunctionalityProvider, ControllerPresentable> {
    // SRP  ???
    id<ControllerPresenter> _transactionPresenter; // dependency
    id<TreeFactory> _treefactory; // dependency
    id<HomeTreeHandling> _homeTreeDelegate;
    DashboardDatasource *datasource;
    id<DashboardStore> _store; // dependency
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation DashboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _treefactory = [[TransactionTreeFactory alloc] initWithDelegate:self]; // Should have injected the external source ?? Voilation ??
    [_homeTreeDelegate setupTreeHandler:_treefactory];
        
    [self setupDatasource];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.collectionView reloadData];
}

-(void)setupDatasource {
    datasource = [[DashboardDatasource alloc] initWithStore:_store];
    _collectionView.dataSource = datasource;
    _collectionView.delegate = datasource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setStore:(id)store {
    _store = store;
}

-(void)setTreeFactory:(id)treeFactory {
    _treefactory = treeFactory;
}

-(void)setHomeTreeDelegate:(id)homeTreeDelegate {
    _homeTreeDelegate = homeTreeDelegate;
}

-(UIViewController *)getViewController {
    return self;
}

-(void)setTransactionPresenter:(id)controllerPresenter {
    _transactionPresenter = controllerPresenter;
}

-(void)nodeSelected:(ParentTreeButton *)sender {
    [_homeTreeDelegate collapseTree];
    id<ActionHandler> treeActionHandler = [[[TreeActionHandlerProvider alloc] initWithDashboardFunctionalityProvider:self] providerTreeActionHandler:sender];
    [treeActionHandler handleAction];
}

-(void)loadIncome {
    id<TransactionStore> store = [[[IncomeStoreFactory alloc] init] getObject];
    Transaction *transaction = [[Income alloc] initWithContext:[ManagedObjectContexter getManagedObjectContext]];
    
    _transactionPresenter = [[TransactionPresenter alloc] initWithStore:store controllerPresentable:self transaction:transaction title:@"Income Addition"];
    
    [_transactionPresenter presentController];
    
}

-(void)loadExpense {
    id<TransactionStore> store = [[[ExpenseStoreFactory alloc] init] getObject];
    Transaction *transaction = [[Expense alloc] initWithContext:[ManagedObjectContexter getManagedObjectContext]];
    
    _transactionPresenter = [[TransactionPresenter alloc] initWithStore:store controllerPresentable:self transaction:transaction title:@"Expense Addition"];
    
    [_transactionPresenter presentController];
}

@end
