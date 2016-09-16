//
//  TransactionTreeFactory.swift
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

import Foundation

enum TransactionTreeButtonTag: Int {
    case Income
    case Expense
}

class TransactionTreeFactory:NSObject, TreeFactory {
    var _privateItems = Array<ParentTreeButton>()
    var _dashboardVc: TreeButtonsProtocol? = nil
    
    init(delegate: TreeButtonsProtocol) {
        _dashboardVc = delegate
    }
    
    @objc func createDefault(frame: CGRect) {
        if _privateItems.count > 0 {
            return
        }
        
        _privateItems.removeAll()
        
        let buttonIncome = SimplePlusButton(name: "Inc", frame: frame)
        buttonIncome.delegate = _dashboardVc
        buttonIncome.tag = TransactionTreeButtonTag.Income.rawValue
        _privateItems.append(buttonIncome)
        
        let buttonExpense = SimplePlusButton(frame: frame)
        buttonExpense.setTitle("Exp", forState: UIControlState.Normal)
        buttonExpense.delegate = _dashboardVc
        buttonExpense.tag = TransactionTreeButtonTag.Expense.rawValue
        _privateItems.append(buttonExpense)
    }
    
    @objc internal var allItems: Array<ParentTreeButton> {
        get {
            return _privateItems
        }
    }
}


