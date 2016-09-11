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
    
    init(transactionPresenter: ControllerPresenter?, delegateToHome: HomeControllerLoading?) {
        self.delegateToHome = delegateToHome
        self.transactionPresenter = transactionPresenter
    }
    
    @objc func loadController() {
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewControllerWithIdentifier("DashboardViewController") as! DashboardViewController
        delegateToHome?.setViewController(vc)
    }
}
