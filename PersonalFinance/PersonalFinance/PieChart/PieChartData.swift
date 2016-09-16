//
//  PieChartData.swift
//  PersonalFinance
//
//  Created by Irfan on 9/15/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

class PieChartData: NSObject {
    var color: UIColor!
    var value: NSNumber!
    var name: String!
    
    init(value: Int, color: UIColor, name: String) {
        self.color = color
        self.value = value
        self.name = name
    }
}
