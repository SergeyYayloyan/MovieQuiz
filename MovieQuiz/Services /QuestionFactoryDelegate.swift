//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Sergey Yayloyan on 18.06.2024.
//

import Foundation


protocol QuestionFactoryDelegate: AnyObject {               
    func didReceiveNextQuestion(question: QuizQuestion?)
}
