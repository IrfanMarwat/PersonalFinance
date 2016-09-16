//
//  TransactionPresenter.swift
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

class TransactionPresenter:NSObject, ControllerPresenter {
    var store: TransactionStore? // dependency --> Constructor Injection
    var accountStore: AccountStore? // dependency --> Constructor Injection
    var controllerPresentable: ControllerPresentable? = nil  // Constructor Injection
    var transaction: Transaction? = nil // Dependency
    var title: String = ""
    
    init(store: TransactionStore?, controllerPresentable: ControllerPresentable, transaction: Transaction, title: String) {
        self.store = store
        self.transaction = transaction
        self.controllerPresentable = controllerPresentable
        self.title = title
    }
    
    @objc func presentController() {
        let vc = UIStoryboard(name: "Transaction", bundle: nil).instantiateViewControllerWithIdentifier("TransactionViewController") as! TransactionViewController
        vc.setTransactionStore(store)
        vc.setAccountStore(AccountStoreFactory().getObject())
        vc.setTransaction(transaction)
        vc.setHeaderString(title)
        controllerPresentable?.getViewController().presentViewController(vc, animated: true, completion: nil)
        
        vc.view.frame = UIScreen.mainScreen().bounds
        vc.view.backgroundColor = UIColor.whiteColor()
    }
}
