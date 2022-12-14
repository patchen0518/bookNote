//
//  NetworkCall.swift
//  BookNotes
//
//  Created by Patrick Chen on 2021/7/2.
//

import Foundation

//https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=av6AvdhvEwjjRyblRjSQxeP7NfEEfxXq

let bookListURL = "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=av6AvdhvEwjjRyblRjSQxeP7NfEEfxXq"
let selectedBookList = "https://api.nytimes.com/svc/books/v3/lists/"

//combined-print-and-e-book-fiction.json?api-key=av6AvdhvEwjjRyblRjSQxeP7NfEEfxXq

class NetWorkCall: ObservableObject {
    @Published var NYbookList = [BookStruct]()
    @Published var NYListOption = [NYListName]()
    
    func getList() {
        if let url = URL(string: bookListURL) {
            let session = URLSession (configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do {
                            let results = try decoder.decode(NYList.self, from: safeData)
                            DispatchQueue.main.async { [self] in
                                self.NYListOption = results.results
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func fetchListData(stringName: String) {
        let newURL = String(selectedBookList + stringName + "?api-key=av6AvdhvEwjjRyblRjSQxeP7NfEEfxXq")
        if let url = URL(string: newURL) {
            let session = URLSession (configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do {
                            let results = try decoder.decode(NYBook.self, from: safeData)
                            DispatchQueue.main.async { [self] in
                                self.NYbookList = results.results.books
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
