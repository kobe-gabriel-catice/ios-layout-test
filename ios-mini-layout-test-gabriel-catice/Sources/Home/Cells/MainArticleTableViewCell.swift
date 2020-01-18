//
//  MainArticleTableViewCell.swift
//  ios-mini-layout-test-gabriel-catice
//
//  Created by Gabriel on 17/01/20.
//  Copyright © 2020 GabrielCatice. All rights reserved.
//

import UIKit

class MainArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
