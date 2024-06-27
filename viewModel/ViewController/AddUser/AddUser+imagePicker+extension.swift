//
//  AddUser+imagePicker+extension.swift
//  viewModel
//
//  Created by Nguyen Anh Tuan on 26/6/24.
//

import UIKit

extension AddUserViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true)
        
        if let imageUri = info[.imageURL] as? URL {
            userModel.imageUri = imageUri
        }
        
        if let image = info[.originalImage] as? UIImage {
            previewImage.image = image
           
        }
    }
}
