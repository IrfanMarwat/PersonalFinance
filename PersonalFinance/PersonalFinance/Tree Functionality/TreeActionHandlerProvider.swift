//
//  TreeActionHandlerProvider.swift
//  PersonalFinance
//
//  Created by Irfan on 9/14/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

@objc protocol TreeActionProvider {
    func providerTreeActionHandler(sender: ParentTreeButton) -> ActionHandler
}

@objc protocol ActionHandler {
    func handleAction()
}

class TreeActionHandlerProvider: NSObject, TreeActionProvider {
    var dashboardFunctionalityProvider: DashboardFunctionalityProvider!
    
    init(dashboardFunctionalityProvider: DashboardFunctionalityProvider) {
        self.dashboardFunctionalityProvider = dashboardFunctionalityProvider
    }
    
    @objc func providerTreeActionHandler(sender: ParentTreeButton) -> ActionHandler {
        switch sender.tag {
            case TransactionTreeButtonTag.Income.rawValue:
                return IncomeLoader(dashboardFunctionalityProvider: dashboardFunctionalityProvider)
            case TransactionTreeButtonTag.Expense.rawValue:
                return ExpenseLoader(dashboardFunctionalityProvider: dashboardFunctionalityProvider)
            
            default:
                return IncomeLoader(dashboardFunctionalityProvider: dashboardFunctionalityProvider)
        }
    }
}

class IncomeLoader: ActionHandler {
    
    var dashboardFunctionalityProvider: DashboardFunctionalityProvider!
    
    init(dashboardFunctionalityProvider: DashboardFunctionalityProvider) {
        self.dashboardFunctionalityProvider = dashboardFunctionalityProvider
    }
    
    @objc func handleAction() {
        dashboardFunctionalityProvider.loadIncome()
    }
}

class ExpenseLoader: ActionHandler {
    
    var dashboardFunctionalityProvider: DashboardFunctionalityProvider!
    
    init(dashboardFunctionalityProvider: DashboardFunctionalityProvider) {
        self.dashboardFunctionalityProvider = dashboardFunctionalityProvider
    }
    
    @objc func handleAction() {
        dashboardFunctionalityProvider.loadExpense()
    }
}
