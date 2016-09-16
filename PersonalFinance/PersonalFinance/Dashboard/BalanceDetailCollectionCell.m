//
//  BalanceDetailCollectionCell.m
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import "BalanceDetailCollectionCell.h"
#import "TableViewDatasource.h"
#import "PersonalFinance-Swift.h"
#import "DashboardCellData.h"

@interface BalanceDetailCollectionCell()<TextFieldDelegate> {
    TableViewDatasource *tableDatasource;
    AccountDetailHandler *accountDetailHandler;
    id<FieldValidator> termValidator;
    id<AlertHandler> toastHandler;
}

@end

@implementation BalanceDetailCollectionCell

-(void)awakeFromNib {
    [super awakeFromNib];
    
    toastHandler = [[ToastHandler alloc] init];
    self.textFieldStartTerm.textFieldDelegate = self;
    self.textFieldEndTerm.textFieldDelegate = self;
}

- (IBAction)buttonFilter:(id)sender {
    [self proceedToFiltering];
}

-(void)proceedToFiltering {
    [_textFieldStartTerm resignFirstResponder];
    [_textFieldEndTerm resignFirstResponder];

    termValidator = [[TermInputValidator alloc] initWithStartTerm:_textFieldStartTerm.text endTerm:_textFieldEndTerm.text];
    
    if ([termValidator validate]) {
        [self filterData];
    } else {
        [toastHandler presentAlert:[[ErrorAlert alloc] initWithMessage:termValidator.errorMessage]];
    }
}

-(void)filterData {
    NSUInteger startTerm = [_textFieldStartTerm.text integerValue];
    NSUInteger endTerm = [_textFieldEndTerm.text integerValue];
    [tableDatasource updateDatasource:[accountDetailHandler getAccountDetailFor:startTerm endTerm:endTerm]];
    _labelSavingYearPerYear.text = [NSString stringWithFormat:@"%0.1f", [accountDetailHandler getTotalSavingFor:startTerm endTerm:endTerm]];
    [self.tableView reloadData];
}

-(void)configureCellWithDependency:(id)cellData {
    accountDetailHandler = cellData;
    _labelSavingYearPerYear.text = [NSString stringWithFormat:@"%0.1f", [accountDetailHandler getTotalSavingFor:1 endTerm:12]];
    [self setUpDatasource];
}

-(void)setUpDatasource {
    tableDatasource = [[TableViewDatasource alloc] initWithListing:[accountDetailHandler getAccountDetailFor:1 endTerm:12]];
    self.tableView.dataSource = tableDatasource;
    self.tableView.delegate = tableDatasource;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.textFieldStartTerm) {
        [self.textFieldStartTerm resignFirstResponder];
        return true;
    }
    [self proceedToFiltering];
    return true;
}

- (void)textFieldDidBeginEditing:(UITextField * __nonnull)textField {
    
}
- (void)textFieldDidEndEditing:(UITextField * __nonnull)textField {
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch * touch = [touches anyObject];
    if(touch.phase == UITouchPhaseBegan) {
        [self.textFieldStartTerm resignFirstResponder];
        [self.textFieldEndTerm resignFirstResponder];
    }
}

@end
