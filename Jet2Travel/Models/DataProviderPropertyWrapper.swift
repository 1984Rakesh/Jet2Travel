//
//  DataProviderPropertyWrapper.swift
//  Jet2Travel
//
//  Created by Rakesh Patole on 12/07/20.
//

import Foundation
import SwiftUI

@propertyWrapper class DataProviderPropertyWrapper<T:DataObject> : DynamicProperty {
    var wrappedValue : DataProvider<T>
    var pageIndex : Int = 0
    
    init(finalPathComponent:String) {
        wrappedValue = DataProvider<T>(finalPathComponent: finalPathComponent)
    }
    
    public func update() {
        do {
            try wrappedValue.dataObjects.performFetch()
        }
        catch {
            print(error)
        }
        
        if( pageIndex == 0 ){
            wrappedValue.fetchData { [weak self] _ in
                self?.pageIndex = self!.pageIndex + 1
                
            }
        }
    }
}
