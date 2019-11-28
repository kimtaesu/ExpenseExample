//
//  MockReportPrinter.swift
//  SwiftExpenseTests
//
//  Created by tskim on 2019/11/06.
//  Copyright © 2019 assin. All rights reserved.
//

@testable import ExpenseExample

class MockReportPrinter: ReportPrinter {

    private var printedText: String = ""

    func print(text: String) {
        printedText += text
    }
    func getText() -> String {
        return printedText
    }
}
