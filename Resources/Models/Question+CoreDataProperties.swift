//
//  Question+CoreDataProperties.swift
//  QuizX
//
//  Created by jothi-pt5112 on 14/07/22.
//
//

import Foundation
import CoreData


extension Question {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Question> {
        return NSFetchRequest<Question>(entityName: "Question")
    }

    @NSManaged public var categoryId: Int64
    @NSManaged public var correctAnswer: String?
    @NSManaged public var optionA: String?
    @NSManaged public var optionB: String?
    @NSManaged public var optionC: String?
    @NSManaged public var optionD: String?
    @NSManaged public var questionId: Int64
    @NSManaged public var questionPhrase: String?
    @NSManaged public var categoryAssociated: Category?

}

extension Question : Identifiable {

}
