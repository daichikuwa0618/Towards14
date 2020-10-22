//
//  StackViewBackgroundViewController.swift
//  Towards14
//
//  Created by 林 大地 on 2020/10/22.
//  Copyright © 2020 林 大地. All rights reserved.
//

import UIKit

class StackViewBackgroundViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    static func makeInstance() -> StackViewBackgroundViewController {
        let storyboard = UIStoryboard(name: "StackViewBackground", bundle: nil)
        return storyboard.instantiateInitialViewController() as! StackViewBackgroundViewController
    }
}
