//
//  PostTableViewCell.swift
//  GymMate
//
//  Created by Khuziama Rehman on 5/28/21.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postImage: UIImageView!
    
    @IBOutlet weak var captionTextView: UILabel!
    
    @IBOutlet weak var usernameTextView: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
