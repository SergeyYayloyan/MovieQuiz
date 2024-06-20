//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Sergey Yayloyan on 18.06.2024.
//

import Foundation
import UIKit


struct AlertModel {
    let title: String
    let message: String
    let buttonText: String
    let completion: (() -> Void)
    init(title: String, message: String, buttonText: String, completion: @escaping () -> Void) {
        self.title = title
        self.message = message
        self.buttonText = buttonText
        self.completion = completion
    }
}

