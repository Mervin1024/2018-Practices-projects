//
//  AnimationView.swift
//  004-一个复杂动画的实现
//
//  Created by 马遥 on 2018/1/23.
//  Copyright © 2018年 马遥. All rights reserved.
//

import UIKit

class AnimationView: UIView {

    let circleLayer = CircleLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        addCircleLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func addCircleLayer() {
        circleLayer.frame = self.layer.bounds
        self.layer.addSublayer(circleLayer)
    }
    
    public func startAnimation() {
        circleLayer.expandAnimation()
    }
}
