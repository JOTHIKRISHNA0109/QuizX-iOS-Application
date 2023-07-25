//
//  User+CoreDataClass.swift
//  QuizX
//
//  Created by jothi-pt5112 on 14/07/22.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject {
    
    func checkPassword(password:String) -> Bool {
        if self.password == password {
            return true
        }
        return false
    }
    
    
    
}
