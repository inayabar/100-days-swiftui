//
//  AddActivityView.swift
//  ProgressTracking
//
//  Created by Iñaki Yabar Bilbao on 21/02/2024.
//

import SwiftUI

struct AddActivityView: View {
    @State private var title = ""
    @State private var description = ""
    var activities: Activities
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                
                TextField("Description", text: $description)
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let activity = Activity(title: title, description: description)
                        activities.items.append(activity)
                        dismiss()
                    }
                }
            }
            .navigationTitle("New activity")
        }
    }
}

#Preview {
    AddActivityView(activities: Activities(items: []))
}
