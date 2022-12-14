//
//  BookStruct.swift
//  BookNotes
//
//  Created by Patrick Chen on 2021/7/2.
//

import Foundation

//MARK: BOOK Struct
struct NYBook: Codable {
    let results: BookList
}

struct BookList: Codable {
    let books: [BookStruct]
}

struct BookStruct: Codable, Identifiable {
    var id: Int {
        return rank
    }
    let rank: Int
    let title: String
    let author: String
    let book_image: String
    let amazon_product_url: String
}

//MARK: BOOKLIST STRUCT
struct NYList: Codable {
    let results: [NYListName]
}

struct NYListName: Codable, Identifiable{
    var id: String {
        return list_name_encoded
    }
    let display_name: String
    let list_name_encoded: String
}
