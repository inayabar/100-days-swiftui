//
//  ActivityDetailView.swift
//  ProgressTracking
//
//  Created by Iñaki Yabar Bilbao on 21/02/2024.
//

import SwiftUI

struct ActivityDetailView: View {
    var activities: Activities
    @State var activity: Activity
    
    var body: some View {
        VStack {
            Text(activity.description)
            
            Stepper("Times completed: \(activity.count)", onIncrement: {
                var newActivity = activity
                newActivity.count += 1
                
                activities.replace(activity: activity, with: newActivity)
                activity = newActivity
                
            }, onDecrement: {
                var newActivity = activity
                newActivity.count -= 1
                
                activities.replace(activity: activity, with: newActivity)
                activity = newActivity
            })
        }
        .navigationTitle(activity.title)
    }
}

#Preview {
    let activities = [Activity(title: "Creatine", description: "lorem ipsum lorem ipsum")]
    return ActivityDetailView(activities: Activities(items: activities), activity: activities.first!)
}
