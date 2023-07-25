//
//  ClickedOption.swift
//  QuizX
//
//  Created by jothi-pt5112 on 11/07/22.
//

import Foundation

protocol ClickedOption : AnyObject {
    
    func buttonClicked(quizCompleted:Bool,response:Response?)
    func clickExitButton(currentQuestion:Int)
    func timeUp(response:Response?)
    
}
