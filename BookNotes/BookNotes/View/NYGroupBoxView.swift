//
//  NYGroupBoxView.swift
//  BookNotes
//
//  Created by Patrick Chen on 2021/7/3.
//

import SwiftUI

struct NYGroupBoxView: View {
    
    @ObservedObject var networkCall: NetWorkCall
    let selectedList: String
    
    @State var search = ""
    @State var index = 0
    @State var columns = Array(repeating: GridItem(.flexible(),spacing: 15), count: 2)
    
    //    var body: some View {
    //        ScrollView {
    //            LazyVGrid(columns: [.init(),.init()], content: {
    //                ForEach(networkCall.NYbookList) { book in
    //                    NavigationLink(
    //                        destination: WebView(url: book.amazon_product_url),
    //                        label: {
    //                            GroupBox (label: Label(book.title, systemImage: "book")
    //                                        .lineLimit(1).minimumScaleFactor(0.7), content: {
    //                                            ImageSync(withURL: book.book_image)
    //                                        })
    //                        })
    //
    //                }
    //            })
    //        }
    //        .navigationTitle(selectedList.localizedUppercase)
    //        .onAppear(perform: {
    //            networkCall.fetchListData(stringName: selectedList)
    //        })
    //    }
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            LazyVStack {
                HStack {
                    Text("Book Store")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                TextField("Search", text: $search)
                    .padding(.vertical,10)
                    .padding(.horizontal)
                    .background(Color.black.opacity(0.07))
                    .cornerRadius(10)
                
                //Carousel List - top 5 item
//                TabView(selection: $index,
//                        content:  {
//                            ForEach(1...5, id:\.self) { index in
//                                //Change Image here
//                                let imageString = networkCall.NYbookList[index].book_image
//                                ImageSync(withURL: imageString)
//                                    //Image Animation
//                                    .frame(height:self.index == index ? 230: 180)
//                                    .cornerRadius(15)
//                                    .padding(.horizontal)
//                                    .tag(index)
//                            }
//                        })
//                    .frame(height: 230)
//                    .padding(.top, 25)
//                    .tabViewStyle(PageTabViewStyle())
//                    .animation(.easeOut)
                
                //MARK: Custom Grid
                HStack {
                    Text("Popular")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    //Change Display Style
                    Button(action: {
                        withAnimation(.easeOut) {
                            if columns.count == 2 {
                                columns.removeLast()
                            } else {
                                columns.append(GridItem(.flexible(),spacing: 15))
                            }
                        }
                    }, label: {
                        Image(systemName: columns.count == 2 ? "rectangle.grid.1x2" : "square.grid.2x2")
                            .font(.system(size: 24))
                            .foregroundColor(.black)
                    })
                }
                .padding(.horizontal)
                .padding(.top, 25)
                
                LazyVGrid(columns: columns, spacing: 25 , content: {
                    
                    //Change your data here
                    ForEach(networkCall.NYbookList) { book in
                        //Custom GridView below
                        GridView(book: book, columns: $columns)
                    }
                })
                .padding([.horizontal,.top])
            }
            .padding(.vertical)
        })
        .background(Color.black.opacity(0.05).edgesIgnoringSafeArea(.all))
        .navigationTitle(selectedList.localizedUppercase)
        .onAppear(perform: {
            networkCall.fetchListData(stringName: selectedList)
        })
    }
}

//struct NYGroupBoxView_Previews: PreviewProvider {
//    static var previews: some View {
//        NYGroupBoxView()
//    }
//}
