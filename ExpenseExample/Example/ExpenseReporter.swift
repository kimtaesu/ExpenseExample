//
//  ExpenseReport.swift
//  SwiftExpense
//
//  Created by tskim on 2019/11/06.
//  Copyright © 2019 assin. All rights reserved.
//

import Foundation


// 19: Delegate: [totalsUpExpenses, totalUpExpense, addExpense]
//    [expenses: List, mealExpenses: Int, total: Int]
// Delegate 기능이 없음
class ExpenseReport {
    var expenses = [Expense]()
    var mealExpenses = 0
    var total = 0

    func totalsUpExpenses() {
        for expense in expenses {
            // 11. Extract Method: totalUpExpense
            totalUpExpense(expense: expense)
        }
    }

    func totalUpExpense(expense: Expense) {
        // 12. Extract Method: isMeal
        // 15 Move: Other Method [Expense.isMeal]
        if expense.isMeal(expense: expense) {
            mealExpenses += expense.amount
        }

        total += expense.amount
    }

    func addExpense(expense: Expense) {
        expenses.append(expense)
    }
}

// 18. Rename File: [ExpenseReporter]

// 19: Delegate: [totalsUpExpenses, totalUpExpense, addExpense]
//    [expenses: List, mealExpenses: Int, total: Int]
// Delegate 기능이 없음
class ExpenseReporter {
    var printer: ReportPrinter!
    let expenseReport = ExpenseReport()
    // 6. Change Signature 기능이 없음


    func printReport(printer: ReportPrinter) {

        self.printer = printer

        // 7. Extract Method: printExpensesAndTotals
        printExpensesAndTotals()
        // 2. Extract Methd: printTotalas
        printTotals(mealExpenses: expenseReport.mealExpenses, total: expenseReport.total)
    }

    private func printExpensesAndTotals() { // 1. Extract Methd: printHeader
        printHeader()

        // 3. 책임 분리: [비용 계산, 비용 출력]

        // 4. Extract Method: totalsUpExpenses
        expenseReport.totalsUpExpenses()

        // 5. Extract Method: printExpenses
        printExpenses()
    }

    // 6. Change Signature 기능이 없음
    private func printExpenses() {
        for expense in expenseReport.expenses {
            // 8. Extract Method: getName
            printer.print(
                    text: String(format: "%@\t%@\t$%.02f\n",
                            // 10. Extract Method: isOverage
                            expense.isOverage(expense: expense) ? "X" : " ", expense.getName(expense: expense), Double(expense.amount) / 100.0))
            // 14 Move: Other Method [Expense.getName]

            // 9. Inline name: getName(expense: expense)
        }
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


    private func getDate() -> String {
        return "9/12/2002"
    }
}


