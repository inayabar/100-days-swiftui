//
//  Mission.swift
//  Moonshot
//
//  Created by Iñaki Yabar Bilbao on 20/02/2024.
//

import Foundation
struct Mission: Decodable, Identifiable {
    struct CrewRole: Decodable {
        let name: String
        let role: String
    }
    
    let id: Int
    let crew: [CrewRole]
    let description: String
    let launchDate: Date?
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
