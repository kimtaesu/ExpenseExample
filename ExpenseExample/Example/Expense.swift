//
//  Expense.swift
//  SwiftExpense
//
//  Created by tskim on 2019/11/06.
//  Copyright © 2019 assin. All rights reserved.
//

class Expense {
    
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
}
