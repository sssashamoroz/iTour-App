//
//  File.swift
//  iTour-App
//
//  Created by Aleksandr Morozov on 21/11/23.
//

import Foundation
import SwiftData

@Model
class Sight {
    var name : String
    
    init(name: String) {
        self.name = name
    }
}
