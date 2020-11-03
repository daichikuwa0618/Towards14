//
//  PageControlViewController.swift
//  Towards14
//
//  Created by 林 大地 on 2020/11/02.
//  Copyright © 2020 林 大地. All rights reserved.
//

import UIKit

class PageControlViewController: UIViewController, UIScrollViewDelegate {

    private var scrollView: UIScrollView!
    private var pageControl: UIPageControl!

    // 合計のページ数
    private var pageCount: Int = 5
    private let scrollViewHeight: CGFloat = 200

    override func viewDidLoad() {
        super.viewDidLoad()

        setupScrollView()
        setupPageControl()

        addContentToScrollView()
    }

    static func makeInstance() -> PageControlViewController {
        let storyboard = UIStoryboard(name: "PageControl", bundle: nil)
        return storyboard.instantiateInitialViewController() as! PageControlViewController
    }

    private func setupScrollView() {
        // scrollViewの画面表示サイズを指定
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: scrollViewHeight))
        // scrollViewのサイズを指定（幅は1メニューに表示するViewの幅×ページ数）
        scrollView.contentSize = CGSize(width: self.view.frame.size.width * CGFloat(pageCount), height: scrollViewHeight)
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        // 水平方向のスクロールインジケータを非表示にする
        scrollView.showsHorizontalScrollIndicator = false
        self.view.addSubview(scrollView)
    }

    private func setupPageControl() {
        // pageControlの表示位置とサイズの設定
        pageControl = UIPageControl(frame: CGRect(x: 0, y: 370, width: self.view.frame.size.width, height: 30))
        // pageControlのページ数を設定
        pageControl.numberOfPages = pageCount
        // pageControlのドットの色
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        // pageControlの現在のページのドットの色
        pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }

    private func addContentToScrollView() {
        // scrollView に背景色を付けただけの UIView を pageCount だけ追加する
        for page in 0..<pageCount {
            let colorView = makeColorView(page: page)
            scrollView.addSubview(colorView)
        }
    }

    private func makeColorView(page: Int) -> UIView {
        // pageCount と page から被らない適当な色を作る
        let startPoint: CGFloat = 0.3
        let endPoint: CGFloat = 0.9
        let ratio: CGFloat = CGFloat(page) / CGFloat(pageCount)
        let colorMagicNumber: CGFloat = startPoint + (endPoint - startPoint) * ratio

        let colorView = UIView(frame: CGRect(x: self.view.frame.size.width * CGFloat(page), y: 0, width: self.view.frame.size.width, height: scrollViewHeight))
        colorView.backgroundColor = UIColor(red: colorMagicNumber, green: 1.0 - colorMagicNumber, blue: colorMagicNumber, alpha: 1.0)

        return colorView
    }

    // scrollViewのページ移動に合わせてpageControlの表示も移動させる
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
    }
}
