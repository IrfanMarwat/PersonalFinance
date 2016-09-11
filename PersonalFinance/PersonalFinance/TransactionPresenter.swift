//
//  TransactionPresenter.swift
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

class TransactionPresenter: ControllerPresenter {
    
    init(store: AccountStore, delegate: ControllerPresentable) {
        self.store = store
        self.controllerPresentable = delegate
    }

    var store: AccountStore? = nil // dependency
    var controllerPresentable: ControllerPresentable? = nil  // dependency
    
    @objc func presentController() {
        let vc = UIStoryboard(name: "Transaction", bundle: nil).instantiateViewControllerWithIdentifier("TransactionViewController") as! TransactionViewController
        
        controllerPresentable?.getViewController().presentViewController(vc, animated: true, completion: nil)
        
        vc.view.frame = UIScreen.mainScreen().bounds
        vc.view.backgroundColor = UIColor.whiteColor()
    }
    
    static func getTransactionPresenter(delegate: ControllerPresentable) -> RegistrationPresenter {
        let coreDatahandler = CoreDataHandlerFactory(entityName: "Account", context: ManagedObjectContexter.getManagedObjectContext()) as! CoreDataHandler
        return RegistrationPresenter(store: FinancedAccountStore(coreDataHandler: coreDatahandler), delegate: delegate)
    }
}
