//
//  BooksView.swift
//  Got Music
//
//  Created by Spencer Hurd on 5/25/22.
//

import SwiftUI

struct BooksView: View {
    
    @State var books = [Book]()
    
    var body: some View {
        List(books) { book in
            Text("\(book.author)")
        }
        .onAppear() {
            Api().loadData { (books) in
                self.books = books
            }
        }.navigationTitle("Book List")
    }
}

struct BooksView_Previews: PreviewProvider {
    static var previews: some View {
        BooksView()
    }
}
