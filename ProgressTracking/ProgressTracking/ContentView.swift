//
//  ContentView.swift
//  ProgressTracking
//
//  Created by Iñaki Yabar Bilbao on 21/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State var activities: Activities = Activities(items: [])
    @State private var addActivitySheetPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            List(activities.items) { activity in
                NavigationLink(value: activity, label: {
                    Text("\(activity.title) (\(activity.count) times)")
                })
            }
            .navigationDestination(for: Activity.self, destination: { activity in
                ActivityDetailView(activities: activities, activity: activity)
            })
            .navigationTitle("Activities")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Add") {
                        addActivitySheetPresented.toggle()
                    }
                }
            }
        }
        .sheet(isPresented: $addActivitySheetPresented) {
            AddActivityView(activities: activities)
        }
    }
}

#Preview {
    return ContentView(activities: Activities(items: [Activity(title: "Creatine", description: "Creteina every day")]))
}
