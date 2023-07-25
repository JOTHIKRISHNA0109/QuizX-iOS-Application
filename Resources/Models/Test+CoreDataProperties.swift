//
//  Test+CoreDataProperties.swift
//  QuizX
//
//  Created by jothi-pt5112 on 14/07/22.
//
//

import Foundation
import CoreData


extension Test {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Test> {
        return NSFetchRequest<Test>(entityName: "Test")
    }

    @NSManaged public var dateCompleted: Date?
    @NSManaged public var sectionId: Int64
    @NSManaged public var testId: Int64
    @NSManaged public var testMarks: Int64
    @NSManaged public var responses: NSSet?
    @NSManaged public var userAssociated: QuizTaken?

}

// MARK: Generated accessors for responses
extension Test {

    @objc(addResponsesObject:)
    @NSManaged public func addToResponses(_ value: Response)

    @objc(removeResponsesObject:)
    @NSManaged public func removeFromResponses(_ value: Response)

    @objc(addResponses:)
    @NSManaged public func addToResponses(_ values: NSSet)

    @objc(removeResponses:)
    @NSManaged public func removeFromResponses(_ values: NSSet)

}

extension Test : Identifiable {

}
