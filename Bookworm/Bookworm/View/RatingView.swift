//
//  RatingView.swift
//  Bookworm
//
//  Created by Iñaki Yabar Bilbao on 23/02/2024.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var label: String = ""
    var maximum: Int = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
                Spacer()
            }
            
            ForEach(1..<maximum + 1, id: \.self) { number in
                Button {
                    rating = number
                } label: {
                    image(for: number)
                        .foregroundStyle(number > rating ? offColor : onColor)
                }
            }
        }
        .buttonStyle(.plain)
    }
    
    func image(for index: Int) -> Image {
        if index > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

#Preview {
    RatingView(rating: .constant(3))
}
