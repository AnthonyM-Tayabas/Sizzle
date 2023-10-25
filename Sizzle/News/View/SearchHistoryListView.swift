//
//  SearchHistoryListView.swift
//  Sizzle
//
//  Created by Tayabas, Anthony Mark (Cognizant) on 10/20/23.
//

import Foundation

import SwiftUI

struct SearchHistoryListView: View {
    
    @ObservedObject var searchVM: SearchViewModel
    let onSubmit: (String) -> ()
    
    var body: some View {
        List {
            HStack {
                Text("Recently Searched")
                    .font(.bodyRegularSizzle)
                    .foregroundColor(.black)
                Spacer()
                
                Button("Clear") {
                    searchVM.removeAllHistory()
                }
                .font(.headlineRegularSizzle)
                .foregroundColor(.accentColor)
            }
            .listRowSeparator(.hidden)
            
            ForEach(searchVM.history, id: \.self) { history in
                Button(history) {
                    onSubmit(history)
                }
                .font(.messageRegularSizzle)
                .foregroundColor(.black)
                .swipeActions {
                    Button(role: .destructive) {
                        searchVM.removeHistory(history)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
            }
        }
        .listStyle(.plain)
    }
}

struct SearchHistoryListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchHistoryListView(searchVM: SearchViewModel.shared) { _ in
            
        }
    }
}
