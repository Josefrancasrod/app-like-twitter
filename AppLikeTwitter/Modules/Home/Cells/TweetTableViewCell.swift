//
//  TweetTableViewCell.swift
//  AppLikeTwitter
//
//  Created by José Francisco Castillo Rodríguez on 02/11/21.
//

import UIKit
import Kingfisher

class TweetTableViewCell: UITableViewCell {
    //MARK: - IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var tweetImageView: UIImageView!
    @IBOutlet weak var videoButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCellWith(post: Tweet){
        nameLabel.text = post.author.names
        userNameLabel.text = post.author.nickname
        tweetLabel.text = post.text
        
        if post.hasImage {
            //configurar image
            tweetImageView.kf.setImage(with: URL(string: post.imageUrl))
        }else{
            tweetImageView.isHidden = true
        }
    }
    
    
}
