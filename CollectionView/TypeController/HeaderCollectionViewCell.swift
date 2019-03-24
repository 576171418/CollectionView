//
//  HeaderCollectionViewCell.swift
//  CollectionView
//
//  Created by fsc on 2019/3/20.
//  Copyright © 2019 fsc. All rights reserved.
//

import UIKit

class HeaderCollectionViewCell: UICollectionViewCell {

    static let forCellReuserIdentifier = "HeaderCollectionReusableView"
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
