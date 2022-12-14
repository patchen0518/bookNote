import SwiftUI
import CoreData

struct ContentView: View {
    
    @StateObject var appOpen = userSettings()
    
    var body: some View {
        TabView{
            BookListView()
                .tabItem { Label("Note List", systemImage: "book") }
                .environmentObject(appOpen)
            
            //NYList()
            //NYGroupBoxView()
            NYBookListSelection()
                .tabItem { Label("Top Book", systemImage: "books.vertical") }
        }
    }
}

//MARK: Preview Function
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
