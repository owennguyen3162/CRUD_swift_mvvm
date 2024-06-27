//
//  DetailUserViewController.swift
//  viewModel
//
//  Created by Nguyen Anh Tuan on 27/6/24.
//

import UIKit
import Kingfisher

class DetailUserViewController: UIViewController, UINavigationControllerDelegate {
    
    var userModel: UserModel
    
    @IBOutlet weak var edt_name: UITextField!
    @IBOutlet weak var img_ava: UIImageView!
    @IBOutlet weak var toggleEditUser: UISwitch!
    
    var ICallBackVoid: ((UserModel) -> ())?
    
    init(userModel: UserModel) {
        self.userModel = userModel
        super.init(nibName: "DetailUserViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail user"
        edt_name.text = userModel.name
        img_ava.kf.setImage(with: userModel.imageUri)
        edt_name.isEnabled = false

    }

    @IBAction func editUserFunc(_ sender: Any) {
        if toggleEditUser.isOn {
                userModel.name = edt_name.text ?? ""
                ICallBackVoid?(userModel)
          
        } else {
            let alert = UIAlertController(title: "Warning", message: "Plesase turn on edit user", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
            present(alert, animated: true)
        }
    }
    
    @IBAction func selectedIMage(_ sender: Any) {
        if toggleEditUser.isOn {
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.delegate = self
            present(imagePickerController, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Warning", message: "Plesase turn on edit user", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
            present(alert, animated: true)
        }
        
    }
    
    @IBAction func toggleAction(_ sender: UISwitch) {
        edt_name.isEnabled  = sender.isOn
        toggleEditUser.isOn = sender.isOn
    }
}

extension DetailUserViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let imageUri = info[.imageURL] as? URL {
            userModel.imageUri = imageUri
        }
        
        if let imagePreview = info[.originalImage] as? UIImage {
            img_ava.image = imagePreview
        }
    }
}
