//
//  ContentArticlesCollectionViewCell.swift
//  ios-mini-layout-test-gabriel-catice
//
//  Created by Gabriel on 17/01/20.
//  Copyright © 2020 GabrielCatice. All rights reserved.
//

import UIKit

class ContentArticlesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(title: String, image: UIImage) {
        label.text = title
        backgroundImageView.image = image
    }

}
