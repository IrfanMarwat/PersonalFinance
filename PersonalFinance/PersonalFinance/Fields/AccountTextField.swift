//
//  AccountTextField.swift
//  PersonalFinance
//
//  Created by Irfan on 9/15/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

class AccountTextField:JVFloatLabeledTextField, UITextFieldDelegate {
 
    let maximumLength = 15
    var textFieldDelegate: TextFieldDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.delegate = self
    }
    
    func restrictSpecialSymbols(string : String) -> Bool {
        let range = string.rangeOfCharacterFromSet(specialSymbolsCharacterSet.invertedSet)
        if let _ = range {
            return true
        }
        else {
            return false
        }
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textFieldDelegate?.textFieldDidBeginEditing(textField)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        textFieldDelegate?.textFieldDidEndEditing(textField)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return textFieldDelegate?.textFieldShouldReturn(textField) ?? false
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if(string == "") {
            return true
        }
        let flag : Bool = self.restrictSpecialSymbols(string)
        let maxLengthNotReached = self.text?.characters.count <= 15
        if(flag && maxLengthNotReached){
            return true
        }
        return false
    }
}
