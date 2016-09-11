//
//  TreeFactory.swift
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

@objc protocol TreeFactory {
    var allItems: Array<ParentTreeButton>{get}
    func createDefault(frame: CGRect)
}
