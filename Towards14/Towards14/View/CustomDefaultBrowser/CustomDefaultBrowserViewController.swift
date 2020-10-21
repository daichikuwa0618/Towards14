//
//  CustomDefaultBrowserViewController.swift
//  Towards14
//
//  Created by 林 大地 on 2020/10/21.
//  Copyright © 2020 林 大地. All rights reserved.
//

import UIKit

class CustomDefaultBrowserViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    static func makeInstance() -> CustomDefaultBrowserViewController {
        let storyboard = UIStoryboard(name: "CustomDefaultBrowser", bundle: nil)
        return storyboard.instantiateInitialViewController() as! CustomDefaultBrowserViewController
    }

    @IBAction func tapOpenURLButton(_ sender: Any) {
        let url = URL(string: "https://apple.com")!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else {
            print("Cannot Open URL")
        }
    }
}
