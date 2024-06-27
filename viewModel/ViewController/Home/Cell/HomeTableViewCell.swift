//
//  HomeTableViewCell.swift
//  viewModel
//
//  Created by Nguyen Anh Tuan on 26/6/24.
//

import UIKit
import Kingfisher

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var img_avatar: UIImageView!
    
    public static var identifier = String(describing: HomeTableViewCell.self)
    
    public static func register() -> UINib {
        UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUp(userModel: UserModel) {
        name.text = userModel.name
        img_avatar.kf.setImage(with: userModel.imageUri)
    }
    
}
