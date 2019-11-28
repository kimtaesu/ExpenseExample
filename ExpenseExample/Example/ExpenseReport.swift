//
//  ExpenseReport.swift
//  SwiftExpense
//
//  Created by tskim on 2019/11/06.
//  Copyright © 2019 assin. All rights reserved.
//

import Foundation

class ExpenseReport {
    private var expenses = [Expense]()

    func printReport(printer: ReportPrinter) {
        var total = 0
        var mealExpenses = 0

        printHeader(printer: printer)
        for expense in expenses {

            if expense.type == .breakfast || expense.type == .dinner {
                mealExpenses += expense.amount
            }

            var name = "TILT"

            switch expense.type {
            case .dinner:
                name = "Dinner"
            case .breakfast:
                name = "Breakfast"
            case .carRental:
                name = "Car Rental"
            }
            
            printer.print(
                text: String(format: "%@\t%@\t$%.02f\n",
                    ((expense.type == .dinner && expense.amount > 5000) ||
                            (expense.type == .breakfast && expense.amount > 1000)) ? "X" : " ", name, Double(expense.amount) / 100.0))
            
            total += expense.amount
        }
        
        printer.print(text: String(format: "\nMeal expenses $%.02f", Double(mealExpenses) / 100.0))
        printer.print(text: String(format: "\nTotal $%.02f", Double(total) / 100.0))
    }
    
    func addExpense(expense: Expense) {
        expenses.append(expense)
    }
        
    private func printHeader(printer: ReportPrinter) {
        printer.print(text: "Expenses \(getDate())\n")
    }
    
    private func getDate() -> String {
        return "9/12/2002"
    }
}


