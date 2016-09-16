//
//  DashbaordLoader.swift
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//


class DashbaordLoader:NSObject, ControllerLoader {
    
    var delegateToHome: HomeControllerLoading? = nil
    var transactionPresenter: ControllerPresenter? = nil
    var treefactory: TreeFactory? = nil;
    
    init(delegateToHome: HomeControllerLoading?) {
        self.delegateToHome = delegateToHome
    }
    
    @objc func loadController() {
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewControllerWithIdentifier("DashboardViewController") as! DashboardViewController
        let dashboardStore = createDashboardStore()
        vc.setStore(dashboardStore)
        vc.setTransactionPresenter(transactionPresenter)
        vc.setHomeTreeDelegate(delegateToHome)
        delegateToHome?.setHeaderTitle("Statistic(Board)")
        delegateToHome?.setViewController(vc)
    }
    
    func createDashboardStore() -> DashboardStore {
        let store = LocalDashboardStore()
        store.createAllDependencies()
        
        return store
    }
}
