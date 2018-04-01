//
//  SocketIntance.swift
//  ControllerApp
//
//  Created by 651 on 2018/3/30.
//  Copyright © 2018年 651. All rights reserved.
//

import CocoaAsyncSocket

class SocketInstance: NSObject {
    static let instance:SocketInstance = SocketInstance()
    var socketclient:GCDAsyncSocket?
    var socketTimer:Timer?
    var isfirst:Bool = true;
    class func getInstance()->SocketInstance{
        return instance
    }
    override init() {
        super.init()
        self.socketConnect()
        self.socketBeat()
    }
    func socketConnect() {
        socketclient = GCDAsyncSocket(delegate: self, delegateQueue: DispatchQueue.main)
        do {
            try socketclient?.connect(toHost: "127.0.0.1", onPort: 5555)
        } catch  {
            print("connect error")
        }
    }
    func socketDidConnect() {
        socketclient?.disconnect()
        socketTimer?.invalidate()
    }
    func socketBeat() {
        socketTimer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(sendBeat), userInfo: nil, repeats: true)
        socketTimer?.fire()
        socketTimer?.fireDate = Date.distantFuture
    }
    @objc func sendBeat() {
        print("beat!!!")
        if(isfirst)
        {
            sendMes(mes: "reg_zhongkong")
            isfirst = false
        }
        else
        {
            sendMes(mes: "im ok")
        }
    }
}
extension SocketInstance:GCDAsyncSocketDelegate{
    func socket(_ sock: GCDAsyncSocket, didConnectToHost host: String, port: UInt16) {
        print("socket connect successful")
        isfirst = true
        socketTimer?.fireDate = Date.distantPast
    }
    
    func socketDidDisconnect(_ sock: GCDAsyncSocket, withError err: Error?) {
        //print("socket connect faile")
        socketConnect()
        socketTimer?.fireDate = Date.distantFuture
    }
    
    func sendMes(mes:String) {
        socketclient?.write(mes.data(using: String.Encoding.utf8)!, withTimeout: 3, tag: 0)
    }
}
