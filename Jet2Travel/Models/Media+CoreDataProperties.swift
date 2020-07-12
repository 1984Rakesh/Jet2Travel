//
//  Media+CoreDataProperties.swift
//  Jet2Travel
//
//  Created by Rakesh Patole on 11/07/20.
//
//

import Foundation
import CoreData


extension Media {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Media> {
        return NSFetchRequest<Media>(entityName: "Media")
    }

    @NSManaged public var createdAt: String?
    @NSManaged public var image: String?
    @NSManaged public var title: String?
    @NSManaged public var url: String?
    @NSManaged public var blogID: String?
    @NSManaged public var id: String?
    @NSManaged public var article: Article?

}
