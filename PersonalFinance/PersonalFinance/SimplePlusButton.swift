//
//  SimplePlusButton.swift
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

class SimplePlusButton: ParentTreeButton {
    var _name = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setTitle(_name, forState: UIControlState.Normal)
        self.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func btnPressed() {
        self.delegate!.nodeSelected(self)
    }
}