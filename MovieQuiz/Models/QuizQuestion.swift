//
//  QuizQuestion.swift
//  MovieQuiz
//
//  Created by Sergey Yayloyan on 16.06.2024.
//

import Foundation
import UIKit

struct QuizQuestion {
    let image: String
    let text: String
    let correctAnswer: Bool
    init(image: String, text: String, correctAnswer: Bool) {
        self.image = image
        self.text = text
        self.correctAnswer = correctAnswer
    }
}
