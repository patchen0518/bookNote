import SwiftUI

struct AddBookForm: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) private var presentationMode
    
    @State private var bookName: String = ""
    @State private var rating: Int = 0
    @State var image = Data(count: 0)
    var defaultImage = UIImage(systemName: "book.fill")?.jpegData(compressionQuality: 1.0)
    
    @State var showPhotoLibrary: Bool = false
    
    var body: some View {
        NavigationView{
            VStack{
                Form {
                    Section(header: Text("Book Information")) {
                        TextField("Book Name", text: $bookName)
                            .autocapitalization(.words)
                        Picker(selection: $rating, label: Text("Book Rating"), content: {
                            ForEach(0...5, id: \.self) { number in
                                number == 0 ? nil:Text("\(number) star")
                            }
                        })
                    }
                    Section(header: Text("Book Image")){
                        Button(action:{showPhotoLibrary.toggle()}, label: {
                            Label("Select Photo", systemImage: "photo.on.rectangle.angled")
                        })
                        if let imageFile = UIImage(data: image) {
                            Image(uiImage: imageFile)
                                .resizable()
                                .frame(minWidth: 100, maxWidth: 400, minHeight: 100, maxHeight: 400, alignment: .center)
                        }
                    }
                }
                .sheet(isPresented: $showPhotoLibrary, content: {
                    ImagePicker(selectedImage: $image)
                })
                HStack {
                    Button(action: {presentationMode.wrappedValue.dismiss()}, label: {
                        Text("Cancel")
                    })
                    .padding(.all)
                    
                    Spacer()
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss();
                        if image == Data() {
                            image = defaultImage!
                        };
                        saveFunc()
                        
                    },
                    label: {
                        Label("Save & Quit", systemImage: "pencil.circle")
                    })
                    .padding(.all)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
    //MARK: CoreData Function
    private func saveFunc() {
        let newBook = Book(context: viewContext)
        newBook.bookName = bookName
        newBook.rating = Int16(rating)
        newBook.notes = ""
        
        newBook.image = image
        
        PersistenceController.shared.globalSaveFunc()
    }
}

//struct AddBookForm_Previews: PreviewProvider {
//    static var previews: some View {
//        AddBookForm()
//    }
//}
