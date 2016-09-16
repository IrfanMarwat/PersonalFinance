//
//  DashboardStore.swift
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

@objc protocol DashboardStore {
    var allDependencies: Array<AnyObject> {get}
    var allIdentifiers: Array<String>{get}
    var allCellWidths: Array<Double>{get}
    var allCellHeights: Array<Double>{get}
    
    func createAllDependencies()
}

class LocalDashboardStore:NSObject, DashboardStore {
    var _privateItems = Array<AnyObject>()
    
    let dashboardIdentifiers = ["listingcell", "expensechart"]
    let dashboardCellWidths = [300.0, 300.0];
    let dashboardCellHights = [390.0, 548.0];
    
    @objc func createAllDependencies() {
        let accountDetailHandler = AccountDetailHandler(incomeCalculator: incomeCalculator, expenseCalculator: expenseCalculator)
        
        _privateItems.append(accountDetailHandler)
        
        let chartDependencyProvider = ChartDependencyProvider()
        chartDependencyProvider.createDependencies()
        _privateItems.append(chartDependencyProvider)
        
    }
    
    @objc internal var allDependencies:Array<AnyObject> {
        get {
            return _privateItems
        }
    }
    
    @objc internal var allIdentifiers: Array<String> {
        get {
            return dashboardIdentifiers
        }
    }
    
    @objc internal var allCellWidths: Array<Double> {
        get {
            return  dashboardCellWidths
        }
    }
    
    @objc internal var allCellHeights: Array<Double> {
        get {
            return  dashboardCellHights
        }
    }
}

class ChartDependencyProvider: NSObject {
    var chartDatabuilder: PieChartDataBuilder! // dependency
    var pieChartHandler: PieChartHandler! // dependency
    var chartTableViewDatasource: ChartTableDatasource! // dependency
    
    func createDependencies() {
        let accountDetailHandler = AccountDetailHandler(incomeCalculator: incomeCalculator, expenseCalculator: expenseCalculator)
        
        chartDatabuilder = PieChartDataBuilder(startTerm: 1, endTerm: 12)
        
        chartDatabuilder.incomeStore = incomeStore
        
        chartDatabuilder.expenseStore = expenseStore
        
        chartDatabuilder.accountDetailHandler = accountDetailHandler
        
        let datasource = chartDatabuilder.getPieChartDatasource()
        pieChartHandler = PieChartHandler(datasource: datasource)
        chartTableViewDatasource = ChartTableDatasource(datasource: datasource)
    }
}
