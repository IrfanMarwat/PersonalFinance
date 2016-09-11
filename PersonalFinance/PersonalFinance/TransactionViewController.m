//
//  ExpenseViewController.m
//  PersonalFinance
//
//  Created by Irfan on 9/10/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import "TransactionViewController.h"
#import "PersonalFinance-Swift.h"

@interface TransactionViewController () {
    id<TransactionStore> _store; // dependency --> Must be injected by external source
    Transaction *_transaction; // dependency --> Must be injected by external source
}

@end

@implementation TransactionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setTransaction:(Transaction *)transaction {
    _transaction = transaction;
}

-(void)setTransactionStore:(id)store {
    _store = store;
}

- (IBAction)saveTransaction:(id)sender {
    [_store createItem:_transaction];
    
    [self dismissViewControllerAnimated:true completion:nil];
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
