//
//  ListView.swift
//  M5_Homework
//
//  Created by Nataly on 25.04.2023.
//

import SwiftUI

struct ListView: View {
    let animals: [Animal]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(animals) { animal in
                    NavigationLink(destination: AnimalDetailsView(animal: animal)) {
                        HStack(spacing: 16) {
                            AsyncImage(url: URL(string: animal.breeds.first?.url ?? ""), placeholder: {
                                Image(systemName: "photo")
                                    .foregroundColor(.gray)
                            }, image: { uiImage in
                                Image(uiImage: uiImage)
                                    .resizable()
                            })
                                .frame(width: 80, height: 80)
                                .cornerRadius(8)
                            
                            Text(animal.name)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Animals")
        }
    }
}


