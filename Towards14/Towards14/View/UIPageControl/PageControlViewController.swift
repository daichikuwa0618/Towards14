//
//  PageControlViewController.swift
//  Towards14
//
//  Created by 林 大地 on 2020/11/02.
//  Copyright © 2020 林 大地. All rights reserved.
//

import UIKit

class PageControlViewController: UIViewController, UIScrollViewDelegate {

    private var scrollView: UIScrollView! = UIScrollView()
    private var pageControl: UIPageControl! = UIPageControl()
    private var textField: UITextField! = UITextField()
    private var button: UIButton! = UIButton()

    // 合計のページ数
    private var pageCount: Int = 5
    private let scrollViewHeight: CGFloat = 200

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never

        setupScrollView()
        setupPageControl()
        setupTextFileld()
        setupButton()

        addContentToScrollView()
    }

    static func makeInstance() -> PageControlViewController {
        let storyboard = UIStoryboard(name: "PageControl", bundle: nil)
        return storyboard.instantiateInitialViewController() as! PageControlViewController
    }

    private func setupScrollView() {
        // scrollView のサイズを指定（幅は 1 メニューに表示する View の幅 × ページ数）
        scrollView.contentSize = CGSize(width: self.view.frame.size.width * CGFloat(pageCount), height: scrollViewHeight)
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        // 水平方向のスクロールインジケータを非表示にする
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            scrollView.widthAnchor.constraint(equalToConstant: self.view.frame.size.width),
            scrollView.heightAnchor.constraint(equalToConstant: scrollViewHeight),
        ])
    }

    private func setupPageControl() {
        // pageControlのページ数を設定
        pageControl.numberOfPages = pageCount
        // pageControlのドットの色
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        // pageControlの現在のページのドットの色
        pageControl.currentPageIndicatorTintColor = UIColor.black
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pageControl)

        NSLayoutConstraint.activate([
            pageControl.widthAnchor.constraint(equalToConstant: self.view.frame.size.width),
            pageControl.heightAnchor.constraint(equalToConstant: 30),
            pageControl.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }

    private func setupTextFileld() {
        // textField
        textField.placeholder = "ページ数を入力"
        textField.keyboardType = .decimalPad
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .done
        textField.clearButtonMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(textField)

        textField.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 20).isActive = true
        textField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 160).isActive = true
    }

    private func setupButton() {
        button.setTitle("反映する", for: .normal)
        button.backgroundColor = UIColor(red: 1, green: 0.1373, blue: 0.4549, alpha: 1.0)
        button.layer.cornerRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false

        button.addTarget(self, action: #selector(self.tapButton(_:)), for: .touchUpInside)

        self.view.addSubview(button)

        button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10).isActive = true
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }

    private func addContentToScrollView() {
        // scrollView に背景色を付けただけの UIView を pageCount だけ追加する
        for page in 0..<pageCount {
            let colorView = makeColorView(page: page)
            scrollView.addSubview(colorView)
        }
    }

    // scrollView と pageControl を入力された数で再描画する
    private func updateViewsWithPages() {
        // scrollView の subViews を全て削除
        scrollView.subviews.forEach { $0.removeFromSuperview() }
        // scrollView のサイズを指定（幅は 1 メニューに表示する View の幅 × ページ数）
        scrollView.contentSize = CGSize(width: self.view.frame.size.width * CGFloat(pageCount), height: scrollViewHeight)
        // 左端に戻す
        scrollView.contentOffset = CGPoint(x: 0, y: 0)
        // UIView を subView に追加
        addContentToScrollView()
        // pageControlのページ数を設定
        pageControl.numberOfPages = pageCount
        pageControl.currentPage = 0
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
        pageControl.currentPage = Int(scrollView.contentOffset.x / self.view.frame.size.width)
    }

    @objc
    private func tapButton(_ sender: UIButton) {
        guard let text = textField.text, let page = Int(text) else { return }
        pageCount = page

        updateViewsWithPages()
    }
}
