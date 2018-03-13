//
//  CustomSwiftView.swift
//  UseObjcCustomViewFromSwift
//
//  Created by TakkuMattsu on 2018/03/14.
//  Copyright © 2018年 TakkuMattsu. All rights reserved.
//

import UIKit

protocol CustomSwiftViewDelegate {
    func didTapped(customView: CustomSwiftView)
}

@IBDesignable class CustomSwiftView: UIView {
    public var delegate: CustomSwiftViewDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    private func initialize() {
        let btn: UIButton = {
            let btn = UIButton.init(type: .custom)
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.addTarget(self, action: #selector(tapped), for: .touchUpInside)
            btn.setTitle("テストボタン", for: .normal)
            btn.setTitleColor(.black, for: .normal)
            btn.setBackgroundImage(createImageFromUIColor(color: .cyan), for: .normal)
            btn.sizeToFit()
            return btn
        }();
        addSubview(btn)
        let constCenterX = NSLayoutConstraint(item: btn, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        let constCenterY = NSLayoutConstraint(item: btn, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        addConstraints([constCenterX, constCenterY])
        self.backgroundColor = .green
    }
    @objc private func tapped() {
        delegate?.didTapped(customView: self)
    }
    private func createImageFromUIColor(color: UIColor) -> UIImage {
        // 1x1のbitmapを作成
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        // bitmapを塗りつぶし
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        // UIImageに変換
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
