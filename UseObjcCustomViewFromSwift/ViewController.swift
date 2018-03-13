//
//  ViewController.swift
//  UseObjcCustomViewFromSwift
//
//  Created by TakkuMattsu on 2018/03/13.
//  Copyright © 2018年 TakkuMattsu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var customView: CustomObjcView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        customView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: CustomObjcViewDelegate {
    func didTapped(_ customView: CustomObjcView!) {
        print("tap!!");
    }
    
}
