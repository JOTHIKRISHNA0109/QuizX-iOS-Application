//
//  Response+CoreDataProperties.swift
//  QuizX
//
//  Created by jothi-pt5112 on 14/07/22.
//
//

import Foundation
import CoreData


extension Response {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Response> {
        return NSFetchRequest<Response>(entityName: "Response")
    }

    @NSManaged public var isCorrect: Bool
    @NSManaged public var questionId: Int64
    @NSManaged public var studentAnswer: String?
    @NSManaged public var testAssociated: Test?

}

extension Response : Identifiable {

}
