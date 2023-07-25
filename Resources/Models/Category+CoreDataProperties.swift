//
//  Category+CoreDataProperties.swift
//  QuizX
//
//  Created by jothi-pt5112 on 14/07/22.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var categoryId: Int64
    @NSManaged public var categoryName: String?
    @NSManaged public var questions: NSSet?

}

// MARK: Generated accessors for questions
extension Category {

    @objc(addQuestionsObject:)
    @NSManaged public func addToQuestions(_ value: Question)

    @objc(removeQuestionsObject:)
    @NSManaged public func removeFromQuestions(_ value: Question)

    @objc(addQuestions:)
    @NSManaged public func addToQuestions(_ values: NSSet)

    @objc(removeQuestions:)
    @NSManaged public func removeFromQuestions(_ values: NSSet)

}

extension Category : Identifiable {

}
