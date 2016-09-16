//
//  RegistrationPresenter.swift
//  PersonalFinance
//
//  Created by Irfan on 9/10/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

import Foundation

class RegistrationPresenter:NSObject, ControllerPresenter {
    var store: AccountStore? = nil // dependency
    var registrationPresentable: ControllerPresentable? = nil  // dependency
    
    init(store: AccountStore, delegate: ControllerPresentable) {
        self.store = store
        self.registrationPresentable = delegate
    }
    
    @objc func presentController() {
        let vc = UIStoryboard(name: "Registration", bundle: nil).instantiateViewControllerWithIdentifier("RegistrationViewController") as! RegistrationViewController
        vc.setStore(store)
        
        registrationPresentable?.getViewController().presentViewController(vc, animated: true, completion: nil)
        
        vc.view.frame = UIScreen.mainScreen().bounds
        vc.view.backgroundColor = UIColor.whiteColor()
    }
    
    static func getRegistrationPresenter(delegate: ControllerPresentable) -> RegistrationPresenter {
        let coreDatahandler = CoreDataHandlerFactory(entityName: "Account", context: ManagedObjectContexter.getManagedObjectContext()) as! CoreDataHandler
        return RegistrationPresenter(store: FinancedAccountStore(coreDataHandler: coreDatahandler), delegate: delegate)
    }
}