//
//  DailyViewController.swift
//  ios-mini-layout-test-gabriel-catice
//
//  Created by Gabriel on 18/01/20.
//  Copyright © 2020 GabrielCatice. All rights reserved.
//

import UIKit

class DailyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.tintColor = .black

        let infoButton = UIButton(type: .infoLight)
        infoButton.addTarget(self, action: #selector(didTouchInfoIcon), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: infoButton)
        self.navigationItem.rightBarButtonItem = barButton
    }

    @objc func didTouchInfoIcon() {
        let alert = UIAlertController(title: "Daily View", message: "Enter your thoughts and how you feel", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
