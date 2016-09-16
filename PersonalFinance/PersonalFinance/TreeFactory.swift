//
//  TreeFactory.swift
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

import Foundation
import CoreGraphics

// Concrete instance of this class will create necessary instances of tree buttons
// TreeHandler will be provided with this dependency

@objc protocol TreeFactory {
    var allItems: Array<ParentTreeButton>{get}
    func createDefault(frame: CGRect)
}
