//
//  PieChartDataBuilder.swift
//  PersonalFinance
//
//  Created by Irfan on 9/15/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

class PieChartDataBuilder: NSObject {
    // SRP --> Calculation for Pie - Chart
    var startTerm: NSNumber! // dependency --> constructor injection
    var endTerm: NSNumber! // dependency --> constructor injection
    
    var incomeStore: TransactionStore! // dependency --> Property injection
    var expenseStore: TransactionStore! // dependency --> Property injection
    var accountDetailHandler: AccountDetailHandler! // dependency --> property injection
    
    init(startTerm: Int, endTerm: Int) {
        self.startTerm = startTerm
        self.endTerm = endTerm
    }
    
    func getTotalIncome(startTerm: Int, endTerm: Int) -> Double {
        return accountDetailHandler.getTotalSavingFor(startTerm, endTerm: endTerm)
    }
    
    func getPieChartDatasource() -> [PieChartData] {
        var list = [PieChartData]()
        let totalTransaction = accountDetailHandler.totalTransactionFor(startTerm.integerValue, endTerm: endTerm.integerValue)
        
        // cohesion ??
        
        for incomeObj in incomeStore.allItems {
            var first = startTerm
            var second = endTerm
            
            if incomeObj.startTerm?.integerValue > startTerm.integerValue {
                first = incomeObj.startTerm?.integerValue
            }
            
            if incomeObj.endTerm?.integerValue < endTerm.integerValue {
                second = incomeObj.endTerm?.integerValue
            }
            
            var difference = (second.integerValue - first.integerValue) + 1 // both start and end is included
            if difference < 0 {
                difference = 0
            }
            let totalAmountPerTerm = (incomeObj.amount?.doubleValue) ?? 0.0
            let totalAmountForAllTerms = totalAmountPerTerm * Double(difference) // for all terms
            
            let value = totalAmountForAllTerms/totalTransaction * (100) // percentage value
            
            let color = RandomColorGenerator.getRandomColor()
            var name = incomeObj.name ?? ""
            name = name + "(Income)"
            
            if value > 0 {
                let pieChartData = PieChartData(value: Int(value), color: color, name: name)
                list.append(pieChartData)
            }
        }
        
        for expenseObj in expenseStore.allItems {
            var first = startTerm
            var second = endTerm
            
            if expenseObj.startTerm?.integerValue > startTerm.integerValue {
                first = expenseObj.startTerm?.integerValue
            }
            
            if expenseObj.endTerm?.integerValue < endTerm.integerValue {
                second = expenseObj.endTerm?.integerValue
            }
            
            var difference = (second.integerValue - first.integerValue) + 1 // both start and end is included
            if difference < 0 {
                difference = 0
            }
            let totalAmountPerTerm = (expenseObj.amount?.doubleValue) ?? 0.0
            let totalAmountForAllTerms = totalAmountPerTerm * Double(difference) // for all terms
            
            let value = totalAmountForAllTerms/totalTransaction * (100) // percentage value
            
            let color = RandomColorGenerator.getRandomColor()
            var name = expenseObj.name ?? ""
            name = name + "(Expense)"
            
            if value > 0 {
                let pieChartData = PieChartData(value: Int(value), color: color, name: name)
                list.append(pieChartData)
            }
        }
        
        return list
    }
}

class RandomColorGenerator {
    static func getRandomColor() -> UIColor {
        let red = CGFloat(arc4random_uniform(255))/255.0
        let green = CGFloat(arc4random_uniform(255))/255.0
        let blue = CGFloat(arc4random_uniform(255))/255.0

        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
