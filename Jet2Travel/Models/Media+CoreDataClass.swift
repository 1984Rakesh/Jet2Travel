//
//  Media+CoreDataClass.swift
//  Jet2Travel
//
//  Created by Rakesh Patole on 11/07/20.
//
//

import Foundation
import CoreData

@objc(Media)
public class Media: NSManagedObject, Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case blogID = "blogId"
        case createdAt, image, title, url
    }
    
    required convenience public init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.context!] as? NSManagedObjectContext else { fatalError() }
        guard let entity = NSEntityDescription.entity(forEntityName: "Media", in: context) else { fatalError() }
        
        self.init(entity: entity, insertInto: context)
        
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.id = try container.decodeIfPresent(String.self, forKey: .id)
            self.blogID = try container.decodeIfPresent(String.self, forKey: .blogID)
            self.createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
            self.image = try container.decodeIfPresent(String.self, forKey: .image)
            self.title = try container.decodeIfPresent(String.self, forKey: .title)
            self.url = try container.decodeIfPresent(String.self, forKey: .url)
        }
        catch {
            throw error
        }
    }
    
    public func encode(to encoder: Encoder) throws {
    }
    
}

