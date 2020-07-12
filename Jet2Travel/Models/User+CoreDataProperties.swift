//
//  User+CoreDataProperties.swift
//  Jet2Travel
//
//  Created by Rakesh Patole on 11/07/20.
//
//

import Foundation
import CoreData


extension User {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var blogID: String?
    @NSManaged public var createdAt: String?
    @NSManaged public var name: String?
    @NSManaged public var avatar: String?
    @NSManaged public var lastname: String?
    @NSManaged public var city: String?
    @NSManaged public var designation: String?
    @NSManaged public var about: String?
    @NSManaged public var id: String?
    @NSManaged public var article: NSSet?

}

// MARK: Generated accessors for article
extension User {

    @objc(addArticleObject:)
    @NSManaged public func addToArticle(_ value: Article)

    @objc(removeArticleObject:)
    @NSManaged public func removeFromArticle(_ value: Article)

    @objc(addArticle:)
    @NSManaged public func addToArticle(_ values: NSSet)

    @objc(removeArticle:)
    @NSManaged public func removeFromArticle(_ values: NSSet)

}
