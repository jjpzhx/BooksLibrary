//
//  AddABookModel.swift
//  LibraryBooks
//
//  Created by Jess Payton on 8/3/19.
//  Copyright © 2019 Jess Payton. All rights reserved.
//

import Foundation

protocol AddABookModelDelegate: class{
    func save(libraryBook: LibraryBook)
}

final class AddABookModel {
    
    private(set) var libraryBook: LibraryBook
    private weak var delegate: AddABookModelDelegate?
    
    //vars added for convenience
    private var isEditing: Bool
    //The following two functions will aid in updating the navigation title and the button text accordingly depending on if it is
    //in edit mode or add mode.
    var buttonText: String { return isEditing ? "Update Book" : "Add Book" }
    var titleText: String { return isEditing ? "Update a Book" : "Add a Book" }
    
    init(libraryBook: LibraryBook, delegate: AddABookModelDelegate, isEditing: Bool){
        self.libraryBook = libraryBook
        self.delegate = delegate
        self.isEditing = isEditing          //this will tell you if LibaryBooksViewController is in edit mode or not
    }
}

extension AddABookModel{
    func saveLibraryBook(bookTitle: String, author: String, numberOfPages: Int, dateRead: Date, ratingControl: Int, notes: String){
        delegate?.save(libraryBook: LibraryBook(
            id: libraryBook.id,
            bookTitle: bookTitle.isEmpty ? libraryBook.bookTitle : bookTitle,
            author: author,
            numberOfPages: numberOfPages,
            dateRead: dateRead,
            ratingControl: ratingControl,
            notes: notes
            )
        )
    }
}
