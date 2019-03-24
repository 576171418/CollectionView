//
//  TypeViewController.swift
//  CollectionView
//
//  Created by fsc on 2019/3/20.
//  Copyright © 2019 fsc. All rights reserved.
//

import UIKit

class TypeViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var itemHeaders = [String]()
    var itemNames: Dictionary<Int, [String]>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        initUI()
    }

}

//MARK: - data
extension TypeViewController {
    func initData() {
        itemHeaders = ["我的频道","频道推荐"]
        itemNames = [0: ["关注","推荐","视频","热点","北京","新时代","图片","头条号","娱乐","问答","体育","科技","懂车帝","财经","军事","国际"],1: ["健康","冬奥","特产","房产","小说","时尚","历史","育儿","直播","搞笑","数码","美食","养生","电影","手机","旅游","宠物","情感"]]
    }
}

//MARK: - UI
extension TypeViewController {
    func initUI() {
        //计算单个Item的大小
        let width: CGFloat = (self.view.frame.width - 5 * 10) / 4
        let height: CGFloat = 40
        
        let flowLayout = UICollectionViewFlowLayout()
        //滚动方向
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.itemSize = CGSize(width: width, height: height)
        flowLayout.headerReferenceSize = CGSize.init(width: self.view.frame.width, height: 50)
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height), collectionViewLayout: flowLayout)
        collectionView.register(UINib.init(nibName: "EditCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: EditCollectionViewCell.forCellReuserIdentifier)
        collectionView.register(UINib(nibName: "HeaderCollectionViewCell", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionViewCell.forCellReuserIdentifier)
        collectionView.contentInset = UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 0)
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        
    }
}

//MARK: - UICollectionViewDelegate
extension TypeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let clickString = itemNames[indexPath.section]![indexPath.row]
        if indexPath.section == 0 {
            itemNames[0]?.remove(at: indexPath.item)
            itemNames[1]?.insert(clickString, at: 0)
            let indexPath1 = IndexPath(row: 0, section: 1)
            collectionView.moveItem(at: indexPath, to: indexPath1)
            print(itemNames[0]!)
            print(itemNames[1]!)
        } else {
            itemNames[0]?.append(clickString)
            itemNames[1]?.remove(at: indexPath.item)
            let indexPath1 = IndexPath(row: itemNames[0]!.count - 1, section: 0)
            collectionView.moveItem(at: indexPath, to: indexPath1)
            print(itemNames[0]!)
            print(itemNames[1]!)
        }
    }
}

//MARK: - UICollectionViewDataSource
extension TypeViewController: UICollectionViewDataSource {
    ///向您的数据源对象询问指定部分中的项目数。
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (itemNames[section]?.count)!
    }
    ///向数据源对象询问集合视图中的部分数量。
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return itemNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: EditCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: EditCollectionViewCell.forCellReuserIdentifier, for: indexPath) as! EditCollectionViewCell
        cell.titleLabel.text = itemNames[indexPath.section]?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionViewCell.forCellReuserIdentifier, for: indexPath) as! HeaderCollectionViewCell
        cell.titleLabel.text = itemHeaders[indexPath.section]
        return cell
    }
}
