//
//  QuizStepViewModel.swift
//  MovieQuiz
//
//  Created by Sergey Yayloyan on 16.06.2024.
//

import UIKit


struct QuizStepViewModel {
    let image: UIImage
    let question: String
    let questionNumber: String
    init(image: UIImage, question: String, questionNumber: String) {
        self.image = image
        self.question = question
        self.questionNumber = questionNumber
    }
}
