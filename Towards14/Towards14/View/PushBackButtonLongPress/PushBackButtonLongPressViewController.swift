//
//  PushBackButtonLongPressViewController.swift
//  Towards14
//
//  Created by 林 大地 on 2020/10/26.
//  Copyright © 2020 林 大地. All rights reserved.
//

import UIKit

class PushBackButtonLongPressViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    static func makeInstance() -> PushBackButtonLongPressViewController {
        let storyboard = UIStoryboard(name: "PushBackButtonLongPress", bundle: nil)
        return storyboard.instantiateInitialViewController() as! PushBackButtonLongPressViewController
    }

    @IBAction func tapButton(_ sender: Any) {
        navigationController?.pushViewController(ChildrenOneViewController.makeInstance(), animated: true)
    }
}
