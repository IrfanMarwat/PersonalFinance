//
//  SimplePlusButton.swift
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

class SimplePlusButton: ParentTreeButton {
    var _name = ""
    
    convenience init(name: String, frame: CGRect) {
        self.init(frame: frame)
        
        self.setTitle(name, forState: UIControlState.Normal)
        self.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 6)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func btnPressed() {
        self.delegate!.nodeSelected(self)
    }
}