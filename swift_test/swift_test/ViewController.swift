//
//  ViewController.swift
//  swift_test
//
//  Created by 马遥 on 2018/1/9.
//  Copyright © 2018年 马遥. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        print(customersInLine.count)
        // 打印出 "5"
        let customerProvider = { customersInLine.remove(at: 0) }
        print(customersInLine.count)
        // 打印出 "5"
        print("Now serving \(customerProvider())!") // Prints "Now serving Chris!"
        print(customersInLine.count)
        // 打印出 "4"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

