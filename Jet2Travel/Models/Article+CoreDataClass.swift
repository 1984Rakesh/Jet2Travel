//
//  Article+CoreDataClass.swift
//  Jet2Travel
//
//  Created by Rakesh Patole on 11/07/20.
//
//

import Foundation
import CoreData

@objc(Article)
public class Article: NSManagedObject, Identifiable, Codable {
    enum CodingKeys: String, CodingKey {
        case id, createdAt, content, comments, likes, media, user
    }
    
    required convenience public init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.context!] as? NSManagedObjectContext else { fatalError() }
        guard let entity = NSEntityDescription.entity(forEntityName: "Article", in: context) else { fatalError() }
        
        self.init(entity: entity, insertInto: context)
        
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
            self.content = try container.decodeIfPresent(String.self, forKey: .content)
            self.comments = try container.decodeIfPresent(Int32.self, forKey: .comments) ?? 0
            self.likes = try container.decodeIfPresent(Int32.self, forKey: .likes) ?? 0
            self.id = try container.decodeIfPresent(String.self, forKey: .id)
            self.medias = try container.decodeIfPresent(Set<Media>.self, forKey: .media) ?? Set<Media>()
            self.users = try container.decodeIfPresent(Set<User>.self, forKey: .user) ?? Set<User>()
        }
        catch {
            throw error
        }
    }
    
    public func encode(to encoder: Encoder) throws {
    }
    
    public var medias : Set<Media> {
        get { media as? Set<Media> ?? [] }
        set { self.addToMedia(newValue as NSSet) }
    }
    
    public var users : Set<User> {
        get { user as? Set<User> ?? [] }
        set { self.addToUser(newValue as NSSet) }
    }
    
    func imageURL() -> URL? {
        return URL(string:self.medias.first?.image ?? "");
    }
    
    private static var RFC3339DateFormatter : DateFormatter = {
        var RFC3339DateFormatter = DateFormatter()
        RFC3339DateFormatter.locale = Locale(identifier: "en_US_POSIX")
        RFC3339DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        RFC3339DateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        return RFC3339DateFormatter
    }()
    
    
    private lazy var createdAtDate : Date? = {
        if let dateString = self.createdAt {
            let date = Article.RFC3339DateFormatter.date(from: dateString)
            return date
        }
        return nil
    }()
    
    func createAgo() -> String {
        if let date = self.createdAtDate {
            let interval = Calendar.current.dateComponents([.year, .month, .day], from: date, to: Date())
            if let year = interval.year, year > 0 {
                return year == 1 ? "\(year)" + " " + "yr" :
                    "\(year)" + " " + "yrs"
            } else if let month = interval.month, month > 0 {
                return month == 1 ? "\(month)" + " " + "mnt" :
                    "\(month)" + " " + "mnts"
            } else if let day = interval.day, day > 0 {
                return day == 1 ? "\(day)" + " " + "day" :
                    "\(day)" + " " + "days"
            } else {
                return "a moment ago"
            }
        }
        
        return ""
    }
}
