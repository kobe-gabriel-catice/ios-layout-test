//
//  HomeViewController.swift
//  ios-mini-layout-test-gabriel-catice
//
//  Created by Gabriel on 17/01/20.
//  Copyright © 2020 GabrielCatice. All rights reserved.
//

import UIKit

struct ContentModel {
    let title: String
    let contents: [Content]

    struct Content {
        let title: String
        let images: UIImage?
    }
}

class HomeViewController: UIViewController {

    @IBOutlet weak var dailyButton: UIButton!
    @IBOutlet weak var monthlyButton: UIButton!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UINib.init(nibName: "MainArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "main_article_cell")
            tableView.register(UINib.init(nibName: "ContentTableViewCell", bundle: nil), forCellReuseIdentifier: "content_article_cell")
            tableView.separatorColor = .clear
            tableView.tableFooterView = UIView(frame: .zero)
            tableView.rowHeight = UITableView.automaticDimension
        }
    }

    private let content = [ContentModel(title: "Featured Articles",
                                        contents: [ContentModel.Content(title: "Title", images: UIImage(named: "erol-ahmed-aIYFR0vbADk-unsplash.jpg")),
                                                   ContentModel.Content(title: "Title", images: UIImage(named: "harli-marten-n7a2OJDSZns-unsplash.jpg"))]),
                           ContentModel(title: "Topics",
                                        contents: [ContentModel.Content(title: "Title", images: UIImage(named: "sean-kong--1B_y4wGs-s-unsplash.jpg")),
                                                   ContentModel.Content(title: "Title", images: UIImage(named: "bekir-donmez-eofm5R5f9Kw-unsplash.jpg"))]),
                           ContentModel(title: "Time to read",
                                        contents: [ContentModel.Content(title: "Title", images: UIImage(named: "verne-ho-BTfDOQLPHlc-unsplash.jpg")),
                                                   ContentModel.Content(title: "Title", images: UIImage(named: "brooke-cagle-4rgGY-Aa308-unsplash.jpg"))])]
    private lazy var numberOfRows = [1, content.count]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        title = "Home"
    }

    @IBAction func dailyButtonTouched(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "dailyView") as! DailyViewController
        navigationController?.pushViewController(newViewController, animated: true)
    }

    @IBAction func monthlyButtonTouched(_ sender: Any) {

    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.numberOfRows[section]
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "main_article_cell", for: indexPath) as? MainArticleTableViewCell {
                return cell
            }
            return UITableViewCell()
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "content_article_cell", for: indexPath) as? ContentTableViewCell {
                let viewModel = content[indexPath.row]
                cell.configure(viewModel)
                return cell
            }
            return UITableViewCell()
        default:
            return UITableViewCell()

        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 237.0
        } else if indexPath.section == 1 {
            return 199.0
        } else {
            return 0
        }
    }
}
