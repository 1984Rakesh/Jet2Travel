//
//  DataProviderError.swift
//  Jet2Travel
//
//  Created by Rakesh Patole on 12/07/20.
//

import Foundation

enum DataProviderError : Error {
    case invalidURL
    case invalidData
    case insertError
}

extension DataProviderError : LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Error creating url"
        
        case .invalidData:
            return "Invalid Data"
            
        case .insertError:
            return "Error inserting data in data base"
        }
    }
}
