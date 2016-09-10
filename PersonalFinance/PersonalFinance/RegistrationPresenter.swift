//
//  RegistrationPresenter.swift
//  PersonalFinance
//
//  Created by Irfan on 9/10/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

class RegistrationPresenter:NSObject, ControllerPresenter {
    var store: AccountStore? = nil // dependency
    var registrationPresentable: RegistrationPresentable? = nil  // dependency
    
    init(store: AccountStore, delegate: RegistrationPresentable) {
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
    
    static func getRegistrationPresenter(delegate: RegistrationPresentable) -> RegistrationPresenter {
        return RegistrationPresenter(store: FinancedAccountStore(), delegate: delegate)
    }
}