//
//  ExpenseViewController.m
//  PersonalFinance
//
//  Created by Irfan on 9/10/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import "TransactionViewController.h"
#import "PersonalFinance-Swift.h"

@interface TransactionViewController ()<TextFieldDelegate> {
    id<TransactionStore> _store; // dependency --> Must be injected by external source
    Transaction *_transaction; // dependency --> Must be injected by external source
    id<AccountStore> _accountStore; // dependency --> Must be injected by external source
    id<FieldValidator> transactionValidator;
    id<AlertHandler> toastHandler;
    NSString *headerInfo;
}

@property (weak, nonatomic) IBOutlet CharacterTextField *textFieldDescription;
@property (weak, nonatomic) IBOutlet AmountTextField *textFieldAmount;
@property (weak, nonatomic) IBOutlet NumberTextField *textFieldStartTerm;
@property (weak, nonatomic) IBOutlet NumberTextField *textFieldEndTerm;
@property (weak, nonatomic) IBOutlet UIButton *buttonTick;
@property (weak, nonatomic) IBOutlet UILabel *labelHeader;

@end

@implementation TransactionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    toastHandler = [[ToastHandler alloc] init];
    
    self.textFieldAmount.textFieldDelegate = self;
    self.textFieldStartTerm.textFieldDelegate = self;
    self.textFieldEndTerm.textFieldDelegate = self;
    self.textFieldDescription.textFieldDelegate = self;
    
    _labelHeader.text = headerInfo;
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

-(void)setAccountStore:(id)store {
    _accountStore = store;
}

-(void)setHeaderString:(NSString *)title {
    headerInfo = title;
}

- (IBAction)buttonRecurrent:(id)sender {
    _buttonTick.selected = !_buttonTick.selected;
    _textFieldEndTerm.userInteractionEnabled = !_textFieldEndTerm.userInteractionEnabled;
}

- (IBAction)saveTransaction:(id)sender {
    [self resignTextFields];
    [self proceedToSaving];
}

-(void)proceedToSaving {
    transactionValidator = [[TransactionValidator alloc] initWithAmount:self.textFieldAmount.text textDescription:self.textFieldDescription.text startTerm:self.textFieldStartTerm.text endTerm:self.textFieldEndTerm.text];
    
    if ([transactionValidator validate]) {
        [self saveData];
    } else {
        [toastHandler presentAlert:[[ErrorAlert alloc] initWithMessage:transactionValidator.errorMessage]];
    }
}

-(void)saveData {
    _transaction.startTerm = [NSNumber numberWithInteger:[_textFieldStartTerm.text integerValue]];
    _transaction.endTerm = [NSNumber numberWithInteger:[_textFieldEndTerm.text integerValue]];
    _transaction.amount = [NSNumber numberWithInteger:[_textFieldAmount.text integerValue]];
    _transaction.name = _textFieldDescription.text;
    
    _transaction.account = [[_accountStore allItems] firstObject];
    [_store createItem:_transaction];
    
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)cancelTransaction:(id)sender {
    [_store rollBack];
    [self dismissViewControllerAnimated:true completion:nil];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self resignTextFields];
    return true;
}

- (void)textFieldDidBeginEditing:(UITextField * __nonnull)textField {
    
}
- (void)textFieldDidEndEditing:(UITextField * __nonnull)textField {
    if ([textField isEqual:self.textFieldStartTerm] && !self.buttonTick.selected) {
        self.textFieldEndTerm.text = textField.text;
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch * touch = [touches anyObject];
    if(touch.phase == UITouchPhaseBegan) {
        [self resignTextFields];
    }
}

-(void)resignTextFields {
    [self.textFieldAmount resignFirstResponder];
    [self.textFieldStartTerm resignFirstResponder];
    [self.textFieldEndTerm resignFirstResponder];
    [self.textFieldDescription resignFirstResponder];
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
