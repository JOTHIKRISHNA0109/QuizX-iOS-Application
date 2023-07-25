//
//  QuizTaken+CoreDataProperties.swift
//  QuizX
//
//  Created by jothi-pt5112 on 14/07/22.
//
//

import Foundation
import CoreData


extension QuizTaken {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<QuizTaken> {
        return NSFetchRequest<QuizTaken>(entityName: "QuizTaken")
    }

    @NSManaged public var userId: Int64
    @NSManaged public var tests: NSSet?

}

// MARK: Generated accessors for tests
extension QuizTaken {

    @objc(addTestsObject:)
    @NSManaged public func addToTests(_ value: Test)

    @objc(removeTestsObject:)
    @NSManaged public func removeFromTests(_ value: Test)

    @objc(addTests:)
    @NSManaged public func addToTests(_ values: NSSet)

    @objc(removeTests:)
    @NSManaged public func removeFromTests(_ values: NSSet)

}

extension QuizTaken : Identifiable {

}
