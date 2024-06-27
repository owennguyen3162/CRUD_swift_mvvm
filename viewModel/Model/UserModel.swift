//
//  UserModel.swift
//  viewModel
//
//  Created by Nguyen Anh Tuan on 27/6/24.
//

import Foundation

class UserModel {
    
    var id: Int
    var name: String
    var imageUri: URL
    
    init(name: String, imageUri: URL, id: Int) {
        self.name = name
        self.imageUri = imageUri
        self.id = id
    }
  
}
