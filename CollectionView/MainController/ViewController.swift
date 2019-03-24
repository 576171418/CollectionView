//
//  ViewController.swift
//  CollectionView
//
//  Created by fsc on 2019/3/19.
//  Copyright © 2019 fsc. All rights reserved.
//

import UIKit

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var collectionView: UICollectionView?
    let identifier = "CollectionViewCell"
//    let headerIdentifier = "CollectionHeaderView"
//    let footIdentifier = "CollectionFooterView"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始化
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 60, height: 60)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 64, width: screenWidth, height: screenHeight-64), collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        self.view.addSubview(collectionView!)
        
        //注册cell
        collectionView?.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifier)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 70
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CollectionViewCell
        cell.bgView.backgroundColor = armColor()
        cell.titleLabel.text = "item \(indexPath.row)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.show(self.storyboard?.instantiateViewController(withIdentifier: "TypeViewController") as! TypeViewController, sender: nil)
    }

    func armColor() -> UIColor {
        let red = CGFloat(arc4random()%256)/255.0
        let green = CGFloat(arc4random()%256)/255.0
        let blue = CGFloat(arc4random()%256)/255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    

}

