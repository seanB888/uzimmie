//
//  SwiftUIView.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 1/27/24.
//

import SwiftUI

struct ReviewSection: View {
    @State var showMore = false
    // let reviews: [Review]
    
    var body: some View {
        VStack {
            Divider()
            HStack {
                
                // Text("Reviews(\(reviews.count))")
                Text("**Review**'")
                    .fontWeight(.bold)
                Spacer()
//                HStack(spacing: 1) {
//                    ForEach(0..<Int(reviews.averageRating), id: \.self) { _ in
//                        Image(systemName: "star.fill")
//                    }
//                    if reviews.hasHalfStar {
//                        Image(systemName: "star.leadinghalf.filled")
//                    }
//                }
//                .frame(width: 45)
                Spacer()
                Button {
                    withAnimation(.easeInOut) {
                        showMore.toggle()
                    }
                } label: {
                    Image(systemName: showMore ? "chevron.up" : "chevron.down")
                        .foregroundStyle(.black)
                        .padding(.leading)
                }
            }
            .padding(.horizontal)
            .frame(maxHeight: 10)
            .frame(maxWidth: .infinity)
            
            VStack(alignment: .leading) {
                ScrollView {
                    Text("Share your thoughts. Be the first to review the '**PRODUCT NAME**'")
//                    if reviews.isEmpty {
//                        Text("Share your thoughts. Be the first to review the '**PRODUCT NAME**'")
//                    } else {
//                        ForEach(reviews) { reviews in
//                            VStack(alignment: .leading) {
//                                // review title
//                                Text("\(reviews.title)")
//                                    .font(.headline)
//                                    .fontWeight(.semibold)
//                                // review text description
//                                Text("\(reviews.text)")
//                                // reviewer name
//                                Text("\(reviews.reviewerName)")
//                                    .font(.footnote)
//                                    .foregroundStyle(.gray)
//                                Divider()
//                                    .padding(.bottom, 10)
//                                
//                            }
//                            .frame(maxWidth: .infinity)
//                            .padding(.horizontal)
//                        }
//                    }
                }
                // MARK: -Post a review button
                Button {
                    // Review Post button here
                } label: {
                    Text("Write A Review")
                        .foregroundStyle(.black)
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .clipShape(Capsule())
                        .overlay(
                            Capsule().stroke(.black, lineWidth: 1)
                        )
                }
            }
            .opacity(showMore ? 1 : 0)
            .frame(height: showMore ? 250 : 30)
        }
    }
}


//extension Array where Element == Review {
//    var averageRating: Double {
//        guard !isEmpty else { return 0.0 }
//        let totalStars = reduce(0) { $0 + Double($1.rating) }
//        return totalStars / Double(count)
//    }
//    
//    var hasHalfStar: Bool {
//        guard !isEmpty else { return false }
//        let average = averageRating
//        return average.truncatingRemainder(dividingBy: 1) != 0
//    }
//}

