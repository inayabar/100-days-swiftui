//
//  Student.swift
//  Bookworm
//
//  Created by Iñaki Yabar Bilbao on 23/02/2024.
//

import Foundation
import SwiftData

@Model
class Student {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
