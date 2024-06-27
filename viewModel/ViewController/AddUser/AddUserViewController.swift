//
//  AddUserViewController.swift
//  viewModel
//
//  Created by Nguyen Anh Tuan on 26/6/24.
//

import UIKit

protocol UserModelDatasource: AnyObject {
    func getArrayUser() -> [UserModel]
}

class AddUserViewController: UIViewController {

    weak var userDatasource: UserModelDatasource?
    
    @IBOutlet weak var textFName: UITextField!
    var completeAddUser: ((UserModel) -> ())!
    var userModel: UserModel = UserModel(name: "", imageUri: URL(string: "https://peopleandskills.danube-region.eu/wp-content/themes/dfd-nat1ve/assets/images/no_image_resized_675-450.jpg")!, id: 4)
    @IBOutlet weak var previewImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add user"
    }

    @IBAction func addUser(_ sender: Any) {
        if let datasource = userDatasource  {
            let lastUser = datasource.getArrayUser().last
            userModel.id =  (lastUser?.id ?? -1) + 1
            userModel.name = textFName.text ?? ""
            let newUserModel = userModel
            completeAddUser(userModel)
        }
       
    }
    
    @IBAction func selectedImage(_ sender: Any) {
        let imagePickerVC = UIImagePickerController()
        imagePickerVC.sourceType = .photoLibrary
        imagePickerVC.delegate = self
        present(imagePickerVC, animated: true)
    }
    
}
