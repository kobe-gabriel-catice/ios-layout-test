//
//  ContentTableViewCell.swift
//  ios-mini-layout-test-gabriel-catice
//
//  Created by Gabriel on 17/01/20.
//  Copyright © 2020 GabrielCatice. All rights reserved.
//

import UIKit

class ContentTableViewCell: UITableViewCell {

    private var viewModel: ContentModel?
    @IBOutlet weak var sectionTitleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(UINib(nibName: "ContentArticlesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionView")
            collectionView.isPagingEnabled = true

            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            collectionView.collectionViewLayout = layout
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(_ viewModel: ContentModel) {
        self.viewModel = viewModel
        sectionTitleLabel.text = viewModel.title
    }
    
}

extension ContentTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.contents.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionView",
                                                         for: indexPath) as? ContentArticlesCollectionViewCell {
            let content = self.viewModel?.contents[indexPath.row]
            cell.configure(title: (content?.title)!, image: (content?.images!)!)
            return cell
        }
        return UICollectionViewCell()
    }
}

extension ContentTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.frame.width*4/5, height: collectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let cellWidth : CGFloat = collectionView.frame.width*4/5

        let numberOfCells = floor(collectionView.frame.width / cellWidth)
        let edgeInsets = (collectionView.frame.width - (numberOfCells * cellWidth)) / (numberOfCells + 1)

        return UIEdgeInsets(top: 0, left: edgeInsets, bottom: 0, right: edgeInsets)
    }
}
