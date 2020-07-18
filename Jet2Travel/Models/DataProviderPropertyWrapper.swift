//
//  DataProviderPropertyWrapper.swift
//  Jet2Travel
//
//  Created by Rakesh Patole on 12/07/20.
//

import Foundation
import SwiftUI

@propertyWrapper class DataProviderPropertyWrapper<T:DataObject> : DynamicProperty {
    @ObservedObject var wrappedValue : DataProvider<T>
    var pageIndex : Int = 0
    
    init(endPoint:String) {
        wrappedValue = DataProvider<T>(endPoint: endPoint)
    }
    
    public func update() {
    }
}
