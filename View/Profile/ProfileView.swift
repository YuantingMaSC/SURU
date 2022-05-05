//
//  ProfileView.swift
//  SURU_Leo
//
//  Created by LEO W on 2022/4/27.
//

import UIKit
import Kingfisher

protocol ProfileViewDelegate: AnyObject {
    func didTapAccountButton(_ view: ProfileView)
    func didTapEditProfilebutton(_ view: ProfileView)
}

class ProfileView: UIView {
    
    weak var delegate: ProfileViewDelegate?
    
    @IBOutlet weak var editProfileButton: UIButton!
    
    @IBAction func tapEditProfilebutton(_ sender: UIButton) {
        self.delegate?.didTapEditProfilebutton(self)
    }
    
    @IBOutlet weak var tapAccountButton: UIButton!
    @IBAction func tapAccountButton(_ sender: Any) {
        self.delegate?.didTapAccountButton(self)
    }
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var follwersCountLabel: UILabel!
    @IBOutlet weak var follwingCountLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    func layoutView(account: Account) {
        editProfileButton.layer.borderWidth = 1
        editProfileButton.layer.borderColor = UIColor.B6?.cgColor
        editProfileButton.layer.cornerRadius = 15
        editProfileButton.clipsToBounds = true
        mainImageView.layer.cornerRadius = 40
        mainImageView.clipsToBounds = true
        mainImageView.kf.setImage(with: URL(string: account.mainImage))
        follwersCountLabel.text = String(account.follower.count)
        follwingCountLabel.text = String(account.followedUser.count)
        nameLabel.text = account.name
        bioLabel.text = "nothing here." //????
        
    }
}
