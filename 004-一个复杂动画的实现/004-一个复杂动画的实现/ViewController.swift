//
//  ViewController.swift
//  004-一个复杂动画的实现
//
//  Created by 马遥 on 2018/1/23.
//  Copyright © 2018年 马遥. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let animationView: AnimationView = AnimationView.init(frame: UIScreen.main.bounds)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(beginAnimation(tap:)))
        
        self.view.addGestureRecognizer(tap)
    }


    @objc func beginAnimation(tap:UITapGestureRecognizer) {
        if self.view.subviews.contains(animationView) {
            animationView.removeFromSuperview()
        }
        self.view.addSubview(animationView)
        animationView.startAnimation()
    }
}

