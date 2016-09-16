//
//  FieldValidator.swift
//  PersonalFinance
//
//  Created by Irfan on 9/15/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

@objc protocol FieldValidator {
    var errorMessage: String{get}
    func validate() -> Bool
}