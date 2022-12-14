import SwiftUI
import CoreData

struct BookView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var bookObject: Book
    
    @EnvironmentObject var appOpen : userSettings
    
    var body: some View {
        VStack{
            HStack{
                Text(bookObject.bookName!)
                    .font(.headline)
                    .padding(.all, 10)
                    Spacer()
            }
            Divider()
            Image(uiImage: loadImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding([.leading, .bottom, .trailing],30)
            
            //Star Struct
            HStack(spacing: 10) {
                ForEach(1...5,id: \.self) { rating in
                    Image(systemName: "star.fill")
                        .foregroundColor(bookObject.rating >= rating ? .yellow : .gray)
                }
                Spacer(minLength: 0)
            }
            
            ZStack{
                TextEditor(text: Binding($bookObject.notes)!)
                    .ignoresSafeArea()
                    .border(Color.black, width: 5)
                if bookObject.notes!.isEmpty {
                    Text("Enter your notes here")
                        .padding(.all)
                        .opacity(0.2)
                }
            }
        }
        .navigationTitle("Detail View")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button(action:saveFunc) {
            Label("Save", systemImage: "plus")
        })
        .onAppear(perform: {
            DispatchQueue.main.async{
                if appOpen.openState {
                    appOpen.firstTime = true
                }
            }
        })
        .alert(isPresented: $appOpen.firstTime, content: {
            Alert(
                title: Text("Note"),
                message: Text(
                    "Please ensure that you click the 'Save' button when you are at the book note page. Fail to do so may result lost data when app is closed"
                ),
                dismissButton: .default(Text("OK"), action: {
                    appOpen.firstTime.toggle(); appOpen.openState.toggle()}
                )
            )
        })
    }
    
    //LoadImage Function
    private func loadImage() -> UIImage {
        guard let savedImage =  UIImage(data: bookObject.image!) else {
            return UIImage(systemName: "book.fill")!
        }
        return savedImage
    }
    
    //MARK: CoreData Function
    private func saveFunc() {
        PersistenceController.shared.globalSaveFunc()
    }
    
    private func deleteFunc(_ object:NSManagedObject){
        viewContext.delete(object)
        saveFunc()
    }
}

//struct BookView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookView(bookObject: )
//    }
//}
