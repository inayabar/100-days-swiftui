//
//  PathStore.swift
//  Navigation
//
//  Created by Iñaki Yabar Bilbao on 21/02/2024.
//

import SwiftUI

@Observable
class PathStore {
    var path: [Int] {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
        guard let data = try? Data(contentsOf: savePath), let decoded = try? JSONDecoder().decode([Int].self, from: data) else {
                path = []
                return
            }
        
        print("Found saved path \(decoded)")
        path = decoded
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(path)
            try data.write(to: savePath)
            print("Saved path. Path now is: \(path)")
        } catch {
            print("Failed to save navigation path")
        }
    }
}

struct PathStoreView: View {
    @State var pathStore = PathStore()
    
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            DetailView(number: 0, path: $pathStore.path)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i, path: $pathStore.path)
                }
        }
    }
}

#Preview {
    PathStoreView()
}
