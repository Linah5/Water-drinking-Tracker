//
//  DataItem.swift
//  Water drinking Tracker
//
//  Created by Linah on 17/04/1446 AH.
//
import Foundation
import SwiftData

@Model
class DataItem: Identifiable {
    
    var id: String
    var name: String
    
    init(name: String) {
        self.id = UUID() .uuidString
        self.name = name
        
        
        
    }
}
