//
//  ExpenseReportTest.swift
//  SwiftExpenseTests
//
//  Created by tskim on 2019/11/06.
//  Copyright © 2019 assin. All rights reserved.
//

import XCTest
@testable import ExpenseExample

// 18. Rename File: [ExpenseReporter]

// 19: Delegate: [totalsUpExpenses, totalUpExpense, addExpense]
//    [expenses: List, mealExpenses: Int, total: Int]
// Delegate 기능이 없음
class ExpenseReporterTest: XCTestCase {
    var report: ExpenseReporter!
    var printer: MockReportPrinter!
    var expense: ExpenseReport!

    override func setUp() {
        report = ExpenseReporter()
        printer = MockReportPrinter()
        expense = report.expenseReport
    }

    func testPrintEmpty() {
        report.printReport(printer: printer)


        XCTAssertEqual(
            "Expenses 9/12/2002\n" +
            "\nMeal expenses $0.00\n" +
            "Total $0.00",
            printer.getText())
    }

    func testPrintOneDinner() {
        expense.addExpense(expense: Expense(type: .dinner, amount: 1678))
        report.printReport(printer: printer)


        XCTAssertEqual(
            "Expenses 9/12/2002\n" +
                " \tDinner\t$16.78\n" +
                "\n" +
                "Meal expenses $16.78\n" +
                "Total $16.78",
            printer.getText())
    }

    func testTwoMeals() {
        expense.addExpense(expense: Expense(type: .dinner, amount: 1000))
        expense.addExpense(expense: Expense(type: .breakfast, amount: 500))
        report.printReport(printer: printer)


        XCTAssertEqual(
            "Expenses 9/12/2002\n" +
                " \tDinner\t$10.00\n" +
                " \tBreakfast\t$5.00\n" +

            "\n" +
                "Meal expenses $15.00\n" +
                "Total $15.00",
            printer.getText())
    }

    func testTwoMealsAndCarRental() {
        expense.addExpense(expense: Expense(type: .dinner, amount: 1000))
        expense.addExpense(expense: Expense(type: .breakfast, amount: 500))
        expense.addExpense(expense: Expense(type: .carRental, amount: 50000))
        report.printReport(printer: printer)


        XCTAssertEqual(
            "Expenses 9/12/2002\n" +
                " \tDinner\t$10.00\n" +
                " \tBreakfast\t$5.00\n" +
                " \tCar Rental\t$500.00\n" +
                "\n" +
                "Meal expenses $15.00\n" +
                "Total $515.00",
            printer.getText())
    }
    
    func testOverages() {
        expense.addExpense(expense: Expense(type: .breakfast, amount: 1000))
        expense.addExpense(expense: Expense(type: .breakfast, amount: 1001))
        expense.addExpense(expense: Expense(type: .dinner, amount: 5000))
        expense.addExpense(expense: Expense(type: .dinner, amount: 5001))
        report.printReport(printer: printer)


        XCTAssertEqual(
            "Expenses 9/12/2002\n" +
                    " \tBreakfast\t$10.00\n" +
                    "X\tBreakfast\t$10.01\n" +
                    " \tDinner\t$50.00\n" +
                    "X\tDinner\t$50.01\n" +
                    "\n" +
                    "Meal expenses $120.02\n" +
                    "Total $120.02",
            printer.getText())
    }
}
