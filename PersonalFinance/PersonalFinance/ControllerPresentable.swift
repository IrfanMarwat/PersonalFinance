//
//  RegistrationPresentable.swift
//  PersonalFinance
//
//  Created by Irfan on 9/10/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

// Will be implement by those controllers that have the capability of presenting controller  -- This means they are containing --> Controller presenter <-- as a dependency

@objc protocol ControllerPresentable {
    func getViewController() -> UIViewController  // presenter will use this to present a other controller on this
}
