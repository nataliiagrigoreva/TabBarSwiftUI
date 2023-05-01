import SwiftUI

struct StackView: View {
    let animals: [Animal]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(animals) { animal in
                        VStack(alignment: .leading) {
                            Text(animal.name)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                                .padding(.horizontal)
                            Divider()
                            ForEach(animal.breeds, id: \.name) { breed in
                                HStack {
                                    AsyncImage(url: URL(string: breed.url)) {
                                        Rectangle().foregroundColor(Color.gray.opacity(0.3))
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 130, height: 130)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                    .shadow(radius: 4)
                                    .padding(.trailing)
                                    Text(breed.name)
                                        .foregroundColor(.primary)
                                    Spacer()
                                }
                                .padding(.horizontal)
                            }
                            Divider()
                                .padding(.vertical, 8)
                        }
                        .padding(.vertical)
                    }
                }
            }
            .navigationBarTitle("Animals")
        }
    }
}

struct StackView_Previews: PreviewProvider {
    static var previews: some View {
        StackView(animals: DataAnimals().animals)
    }
}
