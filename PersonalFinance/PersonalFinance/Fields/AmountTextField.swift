//
//  AmountTextField.swift
//  PersonalFinance
//
//  Created by Irfan on 9/15/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

class AmountTextField: JVFloatLabeledTextField, UITextFieldDelegate {
    
    var dotCount = 0
    var textFieldDelegate: TextFieldDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.delegate = self
    }
    
    func allowOnlyAmountCharacters(string : String)->Bool {
        let inputString = string
        let range = inputString.rangeOfCharacterFromSet(getAmounFieldSet())
        if let _ = range {
            return true
        }
        else {
            return false
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if(string == ""){
            return true
        }
        
        if ((self.text?.containsString(".")) == false) {
            dotCount = 0
        }
        
        if string == "." {
            dotCount = dotCount + 1
            if dotCount <= 1 {
                return true
            } else {
                return false
            }
        }
        
        let flag = self.allowOnlyAmountCharacters(string)
        
        if(flag){
            return true
        }
        return false
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
}
