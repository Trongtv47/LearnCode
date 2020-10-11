//
//  CollectionViewCell.swift
//  LearnCode
//
//  Created by Trần Trọng on 10/11/20.
//  Copyright © 2020 Trần Trọng. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
        
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func configureData(data: Hero) {
        imgView.image = UIImage(named: data.img)
        lblName.text = data.name
    }
}
