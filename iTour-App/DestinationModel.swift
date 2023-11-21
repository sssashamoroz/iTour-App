//
//  DestinationModel.swift
//  iTour-App
//
//  Created by Aleksandr Morozov on 17/11/23.
//

import Foundation
import SwiftData //Swift Data (Step 1. Import Framework)


@Model  // Swift Data (Step 2. Create @Model macro.)
class DestinationModel {
    var name : String
    var details : String
    var date : Date
    var priority : Int
    @Relationship(deleteRule : .cascade) var sights = [Sight]() //Why Initialize?
    
    init(name: String = "", details: String = "", date: Date = .now, priority: Int = 2) {
        self.name = name
        self.details = details
        self.date = date
        self.priority = priority
    }
    
}
