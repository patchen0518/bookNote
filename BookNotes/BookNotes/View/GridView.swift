//
//  GridView.swift
//  BookNotes
//
//  Created by Patrick Chen on 2021/7/13.
//

import SwiftUI

struct GridView: View {
    
    //Replace this with Data structure needed
    var book: BookStruct
    
    @Binding var columns: [GridItem]
    @Namespace var nameSpace
    
    var body: some View {
        VStack {
            if columns.count == 2 {
                VStack (spacing: 15) {
                    
                    //Replace the Image below with desire Image
                    //Image
                    ZStack (alignment: Alignment(horizontal: .trailing , vertical: .top), content: {
                        ImageSync(withURL: book.book_image)
                        
                        //Customize Button --- Optional
                        Button (action: {}, label: {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                                .padding(.all, 10)
                                .background(Color.white)
                                .clipShape(Circle())
                        })
                        .padding(.all,10)
                    })
                    .matchedGeometryEffect(id: "image", in: nameSpace)
                    
                    //Text
                    Text(book.title)
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .matchedGeometryEffect(id: "title", in: nameSpace)
                    
                    Button(action: {}, label: {
                        Text("Buy Now")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 25)
                            .background(Color.red)
                            .cornerRadius(10)
                    })
                    .matchedGeometryEffect(id: "buyNow", in: nameSpace)
                }
            } else {
                HStack (spacing: 15) {
                    //Image
                    ZStack (alignment: Alignment(horizontal: .trailing , vertical: .top), content: {
                        ImageSync(withURL: book.book_image)
                        
                        //Customize Button --- Optional
                        Button (action: {}, label: {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                                .padding(.all, 10)
                                .background(Color.white)
                                .clipShape(Circle())
                        })
                        .padding(.all,10)
                    })
                    .matchedGeometryEffect(id: "image", in: nameSpace)
                    
                    VStack (alignment: .leading, spacing: 10, content: {
                        //Text
                        Text(book.title)
                            .fontWeight(.bold)
                            .matchedGeometryEffect(id: "title", in: nameSpace)
                        
                        Button(action: {}, label: {
                            Text("Buy Now")
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 25)
                                .background(Color.red)
                                .cornerRadius(10)
                        })
                        .padding(.top,10)
                        .matchedGeometryEffect(id: "buyNow", in: nameSpace)
                    })
                }
                .padding(.trailing)
                .background(Color.white)
                .cornerRadius(15)
            }
        }
    }
}

//struct GridView_Previews: PreviewProvider {
//    static var previews: some View {
//        GridView()
//    }
//}
