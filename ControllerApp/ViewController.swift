//
//  ViewController.swift
//  ControllerApp
//
//  Created by 651 on 2018/3/28.
//  Copyright © 2018年 651. All rights reserved.
//

import UIKit

class ViewController: UIViewController,AlertDelegate {
    var socket = SocketInstance.getInstance()
    var userdata = CoredataController.getInstance()
    let dataArr:Array = ["前厅","序厅","正厅","尾厅","序厅","正厅","尾厅","序厅","正厅","尾厅","序厅","正厅","尾厅","序厅","正厅","尾厅","序厅","正厅","尾厅","序厅","正厅","尾厅","序厅","正厅","尾厅","序厅","正厅","尾厅","正厅","尾厅","正厅","尾厅","正厅","尾厅","正厅","正厅","尾厅","正厅","尾厅","尾as"]
    @IBOutlet weak var bgimage: UIImageView!
    var table:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func initUI() {
        self.view.backgroundColor = UIColorFromRGB(hex: "#3299FF", alpha: 1.0)
        let startpoint = CGPoint(x: 0, y: 0)
        let endpoint = CGPoint(x: 1, y: 1)
        
        self.view.layer.insertSublayer(getGradient(startcolor: "#251C42", endcolor: "#1d1433", frame: self.view.frame,startpoint: startpoint,endpoint: endpoint,alpha: 1.0), at: 0)
        bgimage.backgroundColor = UIColor(patternImage: UIImage(named: "line")!)
        bgimage.alpha = 0.05
        
        setTable()
    }
    @IBAction func saveBtn(_ sender: Any) {
        userdata.saveData()
    }
    @IBAction func queryBtn(_ sender: Any) {
        userdata.queryData()
        let alertController = AlertView()
        self.view.addSubview(alertController)
        alertController.delegate = self
    }
}
extension ViewController{
    func setTable() {
        //table = UITableView(frame: CGRect(x: 0, y: 0, width: 150, height: 1000))
        table = UITableView()
        
        table.rowHeight = 70
        table.bounces = false
        table.separatorStyle = UITableViewCellSeparatorStyle.none
        table.delegate = self
        table.dataSource = self
        table.showsVerticalScrollIndicator = false
        table.showsHorizontalScrollIndicator = false
        table.register(TableCell.classForCoder(), forCellReuseIdentifier: "cell")
        //table.backgroundColor = UIColor.clear
        self.view.addSubview(table)
        
        table.snp.makeConstraints { (make) in
            make.width.equalTo(150)
            //make.height.equalTo(100)
            make.top.equalTo(self.view.snp.top).offset(0)
            make.bottom.equalTo(self.view.snp.bottom).offset(0)
        }
    }
    
    func delegateMethod() {
        let sb = UIStoryboard(name:"Main",bundle:nil)
        let loginView = sb.instantiateViewController(withIdentifier: "SettingController") as! SettingController
        self.present(loginView, animated: true, completion: nil)
    }
}
extension ViewController:UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableCell
        cell.namelabel?.text = dataArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
