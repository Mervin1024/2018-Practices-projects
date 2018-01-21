//
//  DelegateViewController.swift
//  连老师课后作业01
//
//  Created by 马遥 on 2018/1/21.
//  Copyright © 2018年 马遥. All rights reserved.
//

import UIKit

@objc protocol MERViewControllerDelegate :NSObjectProtocol {
    func textNeedToSave(viewController:DelegateViewController, text:String!)
}

class DelegateViewController: UIViewController {
    
    weak var delegate: MERViewControllerDelegate?
    var initTitle: String?

    private var textFeild: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createMainView()
        // Do any additional setup after loading the view.
    }
    
    func createMainView() {
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "代理回调"
        self.textFeild = UITextField.init(frame: CGRect.init(x: 0, y: 0, width: 200, height: 44))
        self.textFeild.borderStyle = UITextBorderStyle.bezel
        self.view.addSubview(self.textFeild)
        self.textFeild.center = self.view.center
        self.textFeild.becomeFirstResponder()
        self.textFeild.text = self.initTitle

    }
    
    override func willMove(toParentViewController parent: UIViewController?) {
        if parent == nil && self.delegate != nil {
            let selector = #selector(MERViewControllerDelegate.textNeedToSave(viewController:text:))
            if (self.delegate!.responds(to: selector)) {
                var text = self.textFeild.text
                text = text == nil ? "" : text
                self.delegate?.textNeedToSave(viewController: self,text: text!)
            }
        }
        
    }

}
