//
//  User+CoreDataClass.swift
//  Jet2Travel
//
//  Created by Rakesh Patole on 11/07/20.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject, Codable, Identifiable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case blogID = "blogId"
        case createdAt, name, avatar, lastname, city, designation, about
    }
    
    required convenience public init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.context!] as? NSManagedObjectContext else { fatalError() }
        guard let entity = NSEntityDescription.entity(forEntityName: "User", in: context) else { fatalError() }
        
        self.init(entity: entity, insertInto: context)
        
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.id = try container.decodeIfPresent(String.self, forKey: .id)
            self.blogID = try container.decodeIfPresent(String.self, forKey: .blogID)
            self.createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.avatar = try container.decodeIfPresent(String.self, forKey: .avatar)
            self.lastname = try container.decodeIfPresent(String.self, forKey: .lastname)
            self.city = try container.decodeIfPresent(String.self, forKey: .city)
            self.designation = try? container.decodeIfPresent(String.self, forKey: .designation)
            self.about = try container.decodeIfPresent(String.self, forKey: .about)
        }
        catch {
            throw error
        }
    }
    
    public func encode(to encoder: Encoder) throws {
    }
    
    func avatarURL() -> URL? {
        return URL(string:self.avatar ?? "")
    }
}
