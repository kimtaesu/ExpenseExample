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

    var printer: ReportPrinter!
    // 6. Change Signature 기능이 없음

    func printReport(printer: ReportPrinter) {
        self.printer = printer

        // 7. Extract Method: printExpensesAndTotals
        printExpensesAndTotals()
        // 2. Extract Methd: printTotalas
        printTotals(mealExpenses: mealExpenses, total: total)
    }

    private func printExpensesAndTotals() { // 1. Extract Methd: printHeader
        printHeader()

        // 3. 책임 분리: [비용 계산, 비용 출력]

        // 4. Extract Method: totalsUpExpenses
        totalsUpExpenses()

        // 5. Extract Method: printExpenses
        printExpenses()
    }

    // 6. Change Signature 기능이 없음
    private func printExpenses() {
        for expense in expenses {
            // 8. Extract Method: getName
            printer.print(
                    text: String(format: "%@\t%@\t$%.02f\n",
                            // 10. Extract Method: isOverage
                            isOverage(expense: expense) ? "X" : " ", getName(expense: expense), Double(expense.amount) / 100.0))

            // 9. Inline name: getName(expense: expense)
        }
    }

    private func isOverage(expense: Expense) -> Bool {
        (expense.type == .dinner && expense.amount > 5000) ||
                (expense.type == .breakfast && expense.amount > 1000)
    }

    private func getName(expense: Expense) -> String {
        var name = "TILT"

        switch expense.type {
        case .dinner:
            name = "Dinner"
        case .breakfast:
            name = "Breakfast"
        case .carRental:
            name = "Car Rental"
        }
        return name
    }

    private func totalsUpExpenses() {
        for expense in expenses {
            // 11. Extract Method: totalUpExpense
            totalUpExpense(expense: expense)
        }
    }

    private func totalUpExpense(expense: Expense) {
        if expense.type == .breakfast || expense.type == .dinner {
            mealExpenses += expense.amount
        }

        total += expense.amount
    }

    // 6. Change Signature 기능이 없음
    private func printTotals(mealExpenses: Int, total: Int) {
        printer.print(text: String(format: "\nMeal expenses $%.02f", Double(mealExpenses) / 100.0))
        printer.print(text: String(format: "\nTotal $%.02f", Double(total) / 100.0))
    }

    // 6. Change Signature 기능이 없음
    private func printHeader() {
        printer.print(text: "Expenses \(getDate())\n")
    }

    func addExpense(expense: Expense) {
        expenses.append(expense)
    }

    private func getDate() -> String {
        return "9/12/2002"
    }
}


