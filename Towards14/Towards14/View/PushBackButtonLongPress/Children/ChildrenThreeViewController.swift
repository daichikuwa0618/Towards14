//
//  ChildrenThreeViewController.swift
//  Towards14
//
//  Created by 林 大地 on 2020/10/27.
//  Copyright © 2020 林 大地. All rights reserved.
//

import UIKit

class ChildrenThreeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // backBarButton のタイトルを消す処理
        // NOTE: iOS 14 では長押しでメニューが出るようになったので、 UI/UX 両立のために処理を切り分けている
        if #available(iOS 14.0, *) {
            navigationItem.backButtonDisplayMode = .minimal
            // title = "3番目" も OK
            navigationItem.backButtonTitle = "3番目"
        } else {
            // title = "" も OK
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
    }

    static func makeInstance() -> ChildrenThreeViewController {
        let storyboard = UIStoryboard(name: "ChildrenThree", bundle: nil)
        return storyboard.instantiateInitialViewController() as! ChildrenThreeViewController
    }
}
