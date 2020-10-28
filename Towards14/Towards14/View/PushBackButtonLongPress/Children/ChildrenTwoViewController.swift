//
//  ChildrenTwoViewController.swift
//  Towards14
//
//  Created by 林 大地 on 2020/10/27.
//  Copyright © 2020 林 大地. All rights reserved.
//

import UIKit

class ChildrenTwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backButtonTitle = ""
    }
    
    static func makeInstance() -> ChildrenTwoViewController {
        let storyboard = UIStoryboard(name: "ChildrenTwo", bundle: nil)
        return storyboard.instantiateInitialViewController() as! ChildrenTwoViewController
    }

    @IBAction func tapButton(_ sender: Any) {
        navigationController?.pushViewController(ChildrenThreeViewController.makeInstance(), animated: true)
    }
}
