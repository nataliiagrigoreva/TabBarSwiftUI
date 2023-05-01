//
//  GridView.swift
//  M5_Homework
//
//  Created by Nataly on 25.04.2023.
//

import SwiftUI

struct GridView: View {
    let animals: [Animal]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                ForEach(animals) { animal in
                    Section(header: Text(animal.name).font(.title2).bold().padding(.horizontal, 16)) {
                        ForEach(animal.breeds, id: \.name) { breed in
                            ZStack {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 200, height: 200)
                                    .shadow(color: Color.gray.opacity(0.3), radius: 3, x: 0, y: 2)
                                
                                AsyncImage(url: URL(string: breed.url)) {
                                    Rectangle().foregroundColor(Color.gray.opacity(0.3))
                                }
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 180, height: 180)
                                .clipShape(Circle())
                                
                                VStack {
                                    Spacer()
                                    Text(breed.name)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                        .lineLimit(1)
                                        .padding(.vertical, 8)
                                        .padding(.horizontal, 16)
                                        .background(Color.gray.opacity(0.5))
                                        .clipShape(Capsule())
                                        .padding(.bottom, 16)
                                }
                            }
                            .padding(8)
                        }
                    }
                }
            }
        }
        .navigationTitle("Grid")
    }
}
