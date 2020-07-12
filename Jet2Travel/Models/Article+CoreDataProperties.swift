//
//  Article+CoreDataProperties.swift
//  Jet2Travel
//
//  Created by Rakesh Patole on 11/07/20.
//
//

import Foundation
import CoreData


extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article")
    }

    @NSManaged public var createdAt: String?
    @NSManaged public var content: String?
    @NSManaged public var comments: Int32
    @NSManaged public var likes: Int32
    @NSManaged public var id: String?
    @NSManaged public var media: NSSet?
    @NSManaged public var user: NSSet?

}

// MARK: Generated accessors for media
extension Article {

    @objc(addMediaObject:)
    @NSManaged public func addToMedia(_ value: Media)

    @objc(removeMediaObject:)
    @NSManaged public func removeFromMedia(_ value: Media)

    @objc(addMedia:)
    @NSManaged public func addToMedia(_ values: NSSet)

    @objc(removeMedia:)
    @NSManaged public func removeFromMedia(_ values: NSSet)

}

// MARK: Generated accessors for user
extension Article {

    @objc(addUserObject:)
    @NSManaged public func addToUser(_ value: User)

    @objc(removeUserObject:)
    @NSManaged public func removeFromUser(_ value: User)

    @objc(addUser:)
    @NSManaged public func addToUser(_ values: NSSet)

    @objc(removeUser:)
    @NSManaged public func removeFromUser(_ values: NSSet)

}
