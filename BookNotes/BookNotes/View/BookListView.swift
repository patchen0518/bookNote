import SwiftUI

struct BookListView: View {
    
    @State private var addBook: Bool = false
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Book.bookName, ascending: true)],
        animation: .default)
    private var books: FetchedResults<Book>
    
    var body: some View {
        NavigationView{
            List {
                ForEach(books, id:\.self) { book in
                    NavigationLink(destination:
                                    BookView(bookObject: book)
                    ) {
                        Text("\(book.bookName!)")
                    }
                }
                    .onDelete(perform: deleteItem)
            }
            .navigationTitle("My Book List")
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                    Button(action: {addBook.toggle()}, label: {
                        Label("Add Item", systemImage: "plus")
                    })
            )
            .sheet(isPresented: $addBook, content: {
                AddBookForm()
            })
        }
    }
    
    //MARK: CoreData function
    private func deleteItem(offsets: IndexSet) {
        withAnimation {
            for index in offsets{
                let book = books[index]
                PersistenceController.shared.globalDeleteFunc(book)
            }
        }
    }
}

struct BookListView_Previews: PreviewProvider {
    static var previews: some View {
        BookListView()
    }
}
