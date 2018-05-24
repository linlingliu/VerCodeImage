//
//  ViewController.swift
//  MMVerCodeImageDemo
//
//  Created by LX on 2018/5/24.
//  Copyright © 2018年 LX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.cyan
        var view = MMVerCodeImage(frame: CGRect(x: 0, y: 100, width: 80, height: 35))
        view.showCodeImage()
        self.view.addSubview(view)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

