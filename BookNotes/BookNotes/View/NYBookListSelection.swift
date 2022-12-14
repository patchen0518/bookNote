//
//  NYBookListSelection.swift
//  BookNotes
//
//  Created by Patrick Chen on 2021/7/6.
//

import SwiftUI

struct NYBookListSelection: View {
    
    @StateObject var networkCall = NetWorkCall()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(networkCall.NYListOption) { list in
                    NavigationLink(
                        destination: NYGroupBoxView(networkCall: networkCall, selectedList: list.list_name_encoded),
                        label: {
                            Text(list.display_name)
                        })
                }
            }
            .navigationTitle("New York Times List")
        }
        .onAppear(perform: {
            networkCall.getList()
        })
    }
}

struct NYBookListSelection_Previews: PreviewProvider {
    static var previews: some View {
        NYBookListSelection()
    }
}
