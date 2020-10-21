//
//  MainViewController.swift
//  Towards14
//
//  Created by 林 大地 on 2020/10/21.
//  Copyright © 2020 林 大地. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    private let appTitles = [
        "CustomDefaultBrowser",
        "UIStackViewBackgroundColor",
    ]

    // MARK: - IBOutlet

    @IBOutlet weak var appsTableView: UITableView!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }

    // MARK: - Private methods
    private func setupTableView() {
        appsTableView.delegate = self
        appsTableView.dataSource = self
        appsTableView.tableFooterView = UIView()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appTitles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "app", for: indexPath)
        cell.textLabel?.text = appTitles[indexPath.row]
        return cell
    }


}

