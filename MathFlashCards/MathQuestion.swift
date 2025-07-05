//
//  MathQuestion.swift
//  MathFlashCards
//
//  Created by Dan Beers on 7/5/25.
//

import Foundation

struct MathQuestion
{
    let left: Int
    let right: Int
    let operation: String
    var answer: Int
    {
        switch operation
        {
        case "+": return left + right
        case "-": return left - right
        default: return 0
        }
    }

    var text: String { "What is \(left) \(operation) \(right)?" }

    static func random() -> MathQuestion
    {
        let op = Bool.random() ? "+" : "-"
        let l = Int.random(in: 1 ... 10)
        let r = Int.random(in: 1 ... 10)

        // Make sure subtraction is not negative
        if op == "-" && r > l
        {
            return MathQuestion(left: r, right: l, operation: op)
        }
        else
        {
            return MathQuestion(left: l, right: r, operation: op)
        }
    }
}
