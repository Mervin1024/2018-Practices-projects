//
//  FirstTableViewController.swift
//  连老师课后作业01
//
//  Created by 马遥 on 2018/1/21.
//  Copyright © 2018年 马遥. All rights reserved.
//

import UIKit

enum FirstTableViewCellStyle : NSInteger {
    case block = 0
    case delegate = 1
}

class FirstTableViewController: UITableViewController {

    var dataArray:Array<Array<String>>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initDataArray()
        
    }

    func initDataArray() {
        self.dataArray = Array.init()
        
        // Block
        let blockArray = Array.init(arrayLiteral: "第一个cell","第二个cell","第三个cell")
        let delegateArray = Array.init(arrayLiteral: "第一个cell","第二个cell","第三个cell")
        
        self.dataArray.append(blockArray)
        self.dataArray.append(delegateArray)
    }

}

// MARK: - Table view data source

extension FirstTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section < self.dataArray.count {
            let array = self.dataArray[section]
            return array.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "UITableViewCellIdentifier"
        var cell = tableView .dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        let array = self.dataArray[indexPath.section]

        if indexPath.row < array.count {
            let title = array[indexPath.row]
            cell?.textLabel?.text = title
        }
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UITableViewHeaderFooterView.init()
        view.textLabel?.text = section == 0 ? "Block回调" : "delegate回调"
        return view
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == FirstTableViewCellStyle.block.rawValue {
            let viewController = BlockViewController.init(nibName: nil, bundle: nil)
            var array = self.dataArray[indexPath.section]
            viewController.initTitle = array[indexPath.row]
            weak var weakSelf = self;
            viewController.backBlock = { text in
                array[indexPath.row] = text
                weakSelf?.dataArray[indexPath.section] = array
                tableView.reloadData()
            }
            self.navigationController?.pushViewController(viewController, animated: true)
        } else if indexPath.section == FirstTableViewCellStyle.delegate.rawValue {
            let viewController = DelegateViewController.init(nibName: nil, bundle: nil)
            var array = self.dataArray[indexPath.section]
            viewController.initTitle = array[indexPath.row]
            viewController.view.tag = indexPath.row
            viewController.delegate = self
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

extension FirstTableViewController: MERViewControllerDelegate {
    func textNeedToSave(viewController: DelegateViewController, text: String!) {
        var array = self.dataArray[FirstTableViewCellStyle.delegate.rawValue]
        if viewController.view.tag < array.count {
            array[viewController.view.tag] = text
            self.dataArray[FirstTableViewCellStyle.delegate.rawValue] = array
            tableView.reloadData()
        }
    }
}
