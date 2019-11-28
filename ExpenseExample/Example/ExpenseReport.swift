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
    var mealExpenses = 0
    var total = 0

    func printReport(printer: ReportPrinter) {
        // 1. Extract Methd: printHeader
        printHeader(printer: printer)

        // 3. 책임 분리: [비용 계산, 비용 출력]

        // 4. Extract Method: totalsUpExpenses
        totalsUpExpenses()

        for expense in expenses {
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

        }
        // 2. Extract Methd: printTotalas
        printTotals(printer: printer, mealExpenses: mealExpenses, total: total)
    }

    private func totalsUpExpenses() {
        for expense in expenses {

            if expense.type == .breakfast || expense.type == .dinner {
                mealExpenses += expense.amount
            }

            total += expense.amount
        }
    }

    private func printTotals(printer: ReportPrinter, mealExpenses: Int, total: Int) {
        printer.print(text: String(format: "\nMeal expenses $%.02f", Double(mealExpenses) / 100.0))
        printer.print(text: String(format: "\nTotal $%.02f", Double(total) / 100.0))
    }

    private func printHeader(printer: ReportPrinter) {
        printer.print(text: "Expenses \(getDate())\n")
    }

    func addExpense(expense: Expense) {
        expenses.append(expense)
    }

    private func getDate() -> String {
        return "9/12/2002"
    }
}

