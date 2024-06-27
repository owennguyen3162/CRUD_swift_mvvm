//
//  HomeViewModel.swift
//  viewModel
//
//  Created by Nguyen Anh Tuan on 26/6/24.
//

import Foundation

class HomeViewModel {
    
    var userArrays: [UserModel] = [UserModel(name: "Nguyen anh tuan", imageUri: URL(string: "https://peopleandskills.danube-region.eu/wp-content/themes/dfd-nat1ve/assets/images/no_image_resized_675-450.jpg")!, id: 1),
                              UserModel(name: "Nguyen anh tuan 2", imageUri: URL(string: "https://peopleandskills.danube-region.eu/wp-content/themes/dfd-nat1ve/assets/images/no_image_resized_675-450.jpg")!, id: 2),
                              UserModel(name: "Nguyen anh tuan 3", imageUri: URL(string: "https://peopleandskills.danube-region.eu/wp-content/themes/dfd-nat1ve/assets/images/no_image_resized_675-450.jpg")!, id: 3)
    ]
    
    func numberOfRows () -> Int {
        return userArrays.count
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func addUser (userModel: UserModel) {
        userArrays.append(userModel)
    }
    
    func deleteItem (in indexPath: IndexPath){
        userArrays.remove(at: indexPath.row)
    }
    
}
