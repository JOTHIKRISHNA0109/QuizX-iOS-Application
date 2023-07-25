//
//  User+CoreDataProperties.swift
//  QuizX
//
//  Created by jothi-pt5112 on 14/07/22.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var mailId: String?
    @NSManaged public var name: String?
    @NSManaged public var nickName: String?
    @NSManaged public var password: String?
    @NSManaged public var userId: Int64

}

extension User : Identifiable {

}
