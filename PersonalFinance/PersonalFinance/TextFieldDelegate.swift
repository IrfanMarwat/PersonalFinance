//
//  TextFieldDelegate.swift
//  PersonalFinance
//
//  Created by Irfan on 9/15/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

@objc protocol TextFieldDelegate {
    func textFieldDidBeginEditing(textField: UITextField)
    func textFieldDidEndEditing(textField: UITextField)
    func textFieldShouldReturn(textField: UITextField) -> Bool
}
