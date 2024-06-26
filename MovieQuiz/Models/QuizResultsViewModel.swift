//
//  QuizResultsViewModel.swift
//  MovieQuiz
//
//  Created by Sergey Yayloyan on 16.06.2024.
//

import Foundation
import UIKit

struct QuizResultsViewModel {
    let title: String
    let text: String
    let buttonText: String
    init(title: String, text: String, buttonText: String) {
        self.title = title
        self.text = text
        self.buttonText = buttonText
    }
}
