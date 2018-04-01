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
    let dataArr:Array = ["前厅","序厅","正厅","尾厅"]
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
        self.view.layer.insertSublayer(getGradient(startcolor: "#251C42", endcolor: "#1d1433", frame: self.view.frame), at: 0)
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
        table = UITableView(frame: CGRect(x: 0, y: 0, width: 150, height: 1000))
        table.rowHeight = 60
        table.bounces = false
        table.showsHorizontalScrollIndicator = false
        table.separatorStyle = UITableViewCellSeparatorStyle.none
        table.delegate = self
        table.dataSource = self
        table.register(TableCell.classForCoder(), forCellReuseIdentifier: "cell")
        table.backgroundColor = UIColor.clear
        self.view.addSubview(table)
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
