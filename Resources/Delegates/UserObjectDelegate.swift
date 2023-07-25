//
//  UserObjectDelegate.swift
//  QuizX
//
//  Created by jothi-pt5112 on 18/07/22.
//

import Foundation


protocol UserObjectDelegate : AnyObject {
    func completeSignUp(userObject:User?)
    func cancelButtonClicked()
}
