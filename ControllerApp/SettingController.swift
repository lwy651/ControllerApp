//
//  SettingController.swift
//  ControllerApp
//
//  Created by 651 on 2018/4/1.
//  Copyright © 2018年 651. All rights reserved.
//

import UIKit
class SettingController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func BackClick(_ sender: Any) {
        print("返回主界面")
        self.dismiss(animated: true, completion: nil)
    }
}
