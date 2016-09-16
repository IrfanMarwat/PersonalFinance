//
//  ChartCollectionViewCell.m
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import "ChartCollectionViewCell.h"
#import "XYPieChart.h"
#import "ChartTableDatasource.h"
#import "PersonalFinance-Swift.h"

@interface ChartCollectionViewCell()<TextFieldDelegate> {
    PieChartHandler *pieChartHandler; // dependency
    PieChartDataBuilder *chartDatabuilder; // dependency
    ChartTableDatasource *chartTableViewDatasource; // dependency
    id<FieldValidator> termValidator;
    id<AlertHandler> toastHandler;
}

@end

@implementation ChartCollectionViewCell

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
    NSUInteger startTerm = _textFieldStartTerm.text.integerValue;
    NSUInteger endTerm = _textFieldEndTerm.text.integerValue;
    
    chartDatabuilder.startTerm = [NSNumber numberWithInteger:startTerm];
    chartDatabuilder.endTerm = [NSNumber numberWithInteger:endTerm];
    
    NSArray<PieChartData *> *datasource = [chartDatabuilder getPieChartDatasource];
    
    pieChartHandler.datasource = datasource;
    [self.pieChart reloadData];
    
    [chartTableViewDatasource updateDatasource:datasource];
    [self.tableView reloadData];
    
    _textFieldNetIncome.text = [NSString stringWithFormat:@"%0.1f", [chartDatabuilder getTotalIncome:startTerm endTerm:endTerm]];
}

-(void)configureCellWithDependency:(id)cellData {
    ChartDependencyProvider *chartData = cellData;
    
    chartDatabuilder = chartData.chartDatabuilder;
    pieChartHandler = chartData.pieChartHandler;
    chartTableViewDatasource = chartData.chartTableViewDatasource;
    
    NSArray<PieChartData *> *datasource = [chartDatabuilder getPieChartDatasource];
    pieChartHandler.datasource = datasource;
    
    [chartTableViewDatasource updateDatasource:datasource];
    
    [self setPieChartDatasource];
    [self setChartTableDatasource];
    _textFieldNetIncome.text = [NSString stringWithFormat:@"%0.1f", [chartDatabuilder getTotalIncome:1 endTerm:12]];
}

-(void)setPieChartDatasource {
    self.pieChart.dataSource = pieChartHandler;
    self.pieChart.delegate = pieChartHandler;
    [self.pieChart reloadData];
}

-(void)setChartTableDatasource {
    self.tableView.dataSource = chartTableViewDatasource;
    self.tableView.delegate = chartTableViewDatasource;
    
    [self.tableView reloadData];
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
