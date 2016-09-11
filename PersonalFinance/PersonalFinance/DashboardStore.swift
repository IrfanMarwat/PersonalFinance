//
//  DashboardStore.swift
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

@objc protocol DashboardStore {
    var allItems: Array<DashboardCellData> {get}
    var allIdentifiers: Array<String>{get}
    
    func createItem()
}

class LocalDashboardStore:NSObject, DashboardStore {
    var _privateItems: Array<DashboardCellData>? = nil
    let dashboardIdentifiers = ["listingcell", "expensechart"]
    
    @objc func createItem() {
        if _privateItems != nil {
            _privateItems?.append(DashboardCellData())
        } else {
            _privateItems = Array()
            _privateItems?.append(DashboardCellData());
        }
    }
    
    @objc internal var allItems:Array<DashboardCellData> {
        get {
            return _privateItems!
        }
    }
    
    @objc internal var allIdentifiers: Array<String> {
        get {
            return dashboardIdentifiers
        }
    }

}
