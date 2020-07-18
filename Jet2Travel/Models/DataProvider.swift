//
//  DataProvider.swift
//  Jet2Travel
//
//  Created by Rakesh Patole on 11/07/20.
//

import Foundation
import CoreData
import SwiftUI

extension CodingUserInfoKey {
   static let context = CodingUserInfoKey(rawValue: "context")
}

typealias DataObject = NSManagedObject & Codable

class DataProvider<T:DataObject> : NSObject, NSFetchedResultsControllerDelegate, ObservableObject {
    let baseURL = "https://5e99a9b1bc561b0016af3540.mockapi.io/jet2/api/v1/"
    let finalPathComponent : String
    let dataObjects : NSFetchedResultsController<NSFetchRequestResult>
    private var pageIndex : Int = 1
    
    init(finalPathComponent pathComponent:String) {
        finalPathComponent = pathComponent;
        
        let fetchRequest = T.fetchRequest()
        fetchRequest.sortDescriptors = []
        dataObjects = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                 managedObjectContext: DataStore.shared.viewContext,
                                                 sectionNameKeyPath: nil,
                                                 cacheName: nil)
        
        super.init()        
        dataObjects.delegate = self
    }
    
    func fetchData(completionHandler: @escaping (Error?) -> Void) {
        if( pageIndex == 1 ){
            try? dataObjects.performFetch()
            self.fetchNext(completionHandler: completionHandler)
        }
        else {
            DispatchQueue.main.async {
                completionHandler(nil)
            }
        }
    }
    
    func fetchNext(completionHandler:@escaping(Error?) -> Void ){
        self .fetchData(jsonObjectType: T.self,
                        fromURL: "\(baseURL)/\(finalPathComponent)",
                        pageIndex: pageIndex) { error in
            if( error == nil ){
                self.pageIndex = self.pageIndex + 1
            }
            completionHandler(error)
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.objectWillChange.send()
    }
}

extension DataProvider : RandomAccessCollection {
    typealias Element = T
    typealias Index = Int
    typealias SubSequence = Slice<FetchedResults<T>>
    typealias Indices = Range<Int>
    
    subscript(position: Int) -> T {
        return dataObjects.sections!.first!.objects![position] as! T
    }
    
    var startIndex: Int {
        return 0
    }
    
    var endIndex: Int {
        return dataObjects.sections?.first?.numberOfObjects ?? 0
    }
}

extension DataProvider {
    func newTaskContext() -> NSManagedObjectContext {
        return DataStore.shared.newTaskContext()
    }
    
    func fetchData( jsonObjectType:T.Type,
                    fromURL urlString:String,
                    pageIndex:Int,
                    completionHandler: @escaping (Error?) -> Void) {
        
        let _urlString = urlString + "?page=\(pageIndex)&limit=10"
        guard let feedsURL = URL(string: _urlString) else {
            completionHandler(DataProviderError.invalidURL)
            return
        }
                
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: feedsURL) { (data, response, error) in
            guard error == nil else {
                completionHandler(error)
                return
            }
            
            guard let data = data else {
                completionHandler(DataProviderError.invalidData)
                return
            }
            
            do {
                let taskContext = self.newTaskContext()
                let decoder = JSONDecoder()
                decoder.userInfo[CodingUserInfoKey.context!] = taskContext
                let _ : [T] = try decoder.decode([T].self, from:data)
                try taskContext.save()
            } catch {
                completionHandler(error)
            }
            
            completionHandler(nil)
        }
        
        task.resume()
    }
}
