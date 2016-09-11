//
//  TransactionTreeFactory.swift
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//


class TransactionTreeFactory:NSObject, TreeFactory {
    var _privateItems = Array<ParentTreeButton>()
    var _homeVc: TreeButtonsProtocol? = nil
    
    init(delegate: TreeButtonsProtocol) {
        _homeVc = delegate
    }
    
    @objc func createDefault(frame: CGRect) {
        if _privateItems.count > 0 {
            return
        }
        
        _privateItems.removeAll()
        
        let buttonIncome = SimplePlusButton(frame: frame)
        buttonIncome.setTitle("Income", forState: UIControlState.Normal)
        buttonIncome.delegate = _homeVc
        _privateItems.append(buttonIncome)
        
        let buttonExpense = SimplePlusButton(frame: frame)
        buttonExpense.setTitle("Expense", forState: UIControlState.Normal)
        buttonExpense.delegate = _homeVc
        _privateItems.append(buttonExpense)
    }
    
    @objc internal var allItems: Array<ParentTreeButton> {
        get {
            return _privateItems
        }
    }
}


