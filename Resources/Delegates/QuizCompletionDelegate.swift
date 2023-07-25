//
//  QuizCompletionDelegate.swift
//  QuizX
//
//  Created by jothi-pt5112 on 14/07/22.
//

import Foundation


protocol QuizCompletionDelegate : AnyObject {
    
    func presentScoreCard(points:Int,responseArray:[Response],testObject:Test)
    
    
}
