//
//  Expense.swift
//  SwiftExpense
//
//  Created by tskim on 2019/11/06.
//  Copyright © 2019 assin. All rights reserved.
//

// 23. Pull down (자식 클래스 abstract func) [isOverage, getName, isMeal]
protocol Expensing {
    func isOverage(expense: Expense) -> Bool
    func getName(expense: Expense) -> String
    func isMeal(expense: Expense) -> Bool
}

class Expense: Expensing {
    func isOverage(expense: Expense) -> Bool {
        fatalError()
    }

    func getName(expense: Expense) -> String {
        fatalError()
    }

    func isMeal(expense: Expense) -> Bool {
        fatalError()
    }

    enum ExpenseType {
        case dinner
        case breakfast
        case carRental
    }

    let type: ExpenseType
    let amount: Int

    public init(type: ExpenseType, amount: Int) {
        self.type = type
        self.amount = amount
    }

    // 13. Move: Other File [Expense.isOverage]

    // 22. Pull down (자식 클래스 abstract func) [isOverage, getName, isMeal]
//    func isOverage(expense: Expense) -> Bool {
//        (expense.type == .dinner && expense.amount > 5000) ||
//                (expense.type == .breakfast && expense.amount > 1000)
//    }

//    func getName(expense: Expense) -> String {
//        var name = "TILT"
//
//        switch expense.type {
//        case .dinner:
//            name = "Dinner"
//        case .breakfast:
//            name = "Breakfast"
//        case .carRental:
//            name = "Car Rental"
//        }
//        return name
//    }
//
//    func isMeal(expense: Expense) -> Bool {
//        expense.type == .breakfast || expense.type == .dinner
//    }
}
