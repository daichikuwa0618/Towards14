//
//  ChildrenOneViewController.swift
//  Towards14
//
//  Created by 林 大地 on 2020/10/27.
//  Copyright © 2020 林 大地. All rights reserved.
//

import UIKit

class ChildrenOneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    static func makeInstance() -> ChildrenOneViewController {
        let storyboard = UIStoryboard(name: "ChildrenOne", bundle: nil)
        return storyboard.instantiateInitialViewController() as! ChildrenOneViewController
    }

    @IBAction func tapButton(_ sender: Any) {
        navigationController?.pushViewController(ChildrenTwoViewController.makeInstance(), animated: true)
    }
}
