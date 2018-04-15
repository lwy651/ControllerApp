//
//  MenuCollection.swift
//  ControllerApp
//
//  Created by 651 on 2018/4/13.
//  Copyright © 2018年 651. All rights reserved.
//

import UIKit
class MenuCollection:UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        createCollection()
    }
    
    func createCollection() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1.5
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: 200, height: 200)
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        let menuview:UICollectionView = UICollectionView(frame: CGRect(x: 200 , y: 100, width: 500, height: 500), collectionViewLayout: layout)
        menuview.register(MyCollectionCell.self, forCellWithReuseIdentifier: "cell")
        menuview.showsHorizontalScrollIndicator = false
        self.addSubview(menuview)
        menuview.delegate = self
        menuview.dataSource = self
        //menuview.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension MenuCollection:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5000
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:MyCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionCell
        return cell
    }
    private func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 400, height: 600)
    }
}
