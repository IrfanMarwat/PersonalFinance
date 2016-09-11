//
//  HomeTreeHandling.swift
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

@objc protocol HomeTreeHandling {
    func setupTreeHandler(factory: TreeFactory)
    func collapseTree()
}