import SwiftUI

struct AnimalDetailsView: View {
    let animal: Animal
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(animal.breeds, id: \.name) { breed in
                    VStack(alignment: .leading, spacing: 8) {
                        AsyncImage(url: URL(string: breed.url), placeholder: {
                            Image(systemName: "photo")
                                .foregroundColor(.gray)
                        }, image: { uiImage in
                            Image(uiImage: uiImage)
                                .resizable()
                        })
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                        
                        Text(breed.name)
                            .font(.headline)
                        
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal)
                }
            }
        }
    }
}

