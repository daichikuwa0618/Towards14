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
        "PushBackButtonLongPress",
        "UIPageControl",
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        // 選択された cell によって遷移先を切り替える
        // NOTE: indexPath.row をハードコーディングによって分岐しているがあまり良い実装ではない
        //       この記述によって意図しない ViewController へ遷移する等の問題が考えられる
        //       対策としては enum を使う等がある。
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(CustomDefaultBrowserViewController.makeInstance(), animated: true)
        case 1:
            navigationController?.pushViewController(StackViewBackgroundViewController.makeInstance(), animated: true)
        case 2:
            navigationController?.pushViewController(PushBackButtonLongPressViewController.makeInstance(), animated: true)
        case 3:
            navigationController?.pushViewController(PageControlViewController.makeInstance(), animated: true)
        default:
            return
        }
    }
}
