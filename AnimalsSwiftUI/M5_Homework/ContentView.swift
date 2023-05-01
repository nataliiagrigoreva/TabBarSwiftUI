import SwiftUI

struct ContentView: View {
    let animals: [Animal] = DataAnimals().animals
    
    var body: some View {
        TabView {
            StackView(animals: animals)
                .tabItem {
                    Label("Stack", systemImage: "list.bullet")
                }
            
            GridView(animals: animals)
                .tabItem {
                    Label("Grid", systemImage: "square.grid.2x2")
                }
            
            ListView(animals: animals)
                .tabItem {
                    Label("List", systemImage: "rectangle.grid.1x2")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
