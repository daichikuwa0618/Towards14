//
//  PageControlViewController.swift
//  Towards14
//
//  Created by 林 大地 on 2020/11/02.
//  Copyright © 2020 林 大地. All rights reserved.
//

import UIKit

class PageControlViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    static func makeInstance() -> PageControlViewController {
        let storyboard = UIStoryboard(name: "PageControl", bundle: nil)
        return storyboard.instantiateInitialViewController() as! PageControlViewController
    }
}
