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
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "3番目", style: .plain, target: nil, action: nil)
    }

    static func makeInstance() -> ChildrenThreeViewController {
        let storyboard = UIStoryboard(name: "ChildrenThree", bundle: nil)
        return storyboard.instantiateInitialViewController() as! ChildrenThreeViewController
    }
}
