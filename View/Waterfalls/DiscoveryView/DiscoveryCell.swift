//
//  DiscoveryCell.swift
//  SURU_Leo
//
//  Created by LEO W on 2022/5/1.
//

import UIKit
import Kingfisher

protocol DiscoveryCellDelegate: AnyObject {
    func didTapLikeButton(_ view: DiscoveryCell, comment: Comment)
    
    func didTapUnLikeButton(_ view: DiscoveryCell, comment: Comment)
}

class DiscoveryCell: UICollectionViewCell {
    weak var delegate: DiscoveryCellDelegate?
    var commentHolder: Comment?
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBAction func tapLikeButton(_ sender: UIButton) {
        guard let commentHolder = commentHolder else {
            return
        }

        if likeButton.tintColor == .systemRed {
            self.delegate?.didTapUnLikeButton(self, comment: commentHolder)
        } else {
            likeButton.tintColor = .systemRed
            self.delegate?.didTapLikeButton(self, comment: commentHolder)
        }
        
    }
    
    
    func layoutCell(author: Account, comment: Comment, currentUser: Account, store: Store) {
        commentHolder = comment
        mainImageView.kf.setImage(with: URL(string: comment.mainImage))
            nameLabel.text = "\(store.name) -\n\(comment.meal)"
            authorImageView.kf.setImage(with: URL(string: author.mainImage))
            authorNameLabel.text = author.name
        
        likeButton.titleLabel?.text = String(comment.likedUserList.count)
//        if currentUser.likedComment.contains(where: { $0.likeComment == comment.commentID}) {
//            likeButton.isSelected = true
//        } else {
//            likeButton.isSelected = false
//        }
                                  
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        //配置点赞按钮被选中时的样式
        self.layer.borderColor = UIColor.B5?.cgColor
        self.layer.borderWidth = 0.5
//        let icon = UIImage(systemName: "heart.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)
//        likeButton.setImage(icon, for: .selected)
        
    }
    
}
