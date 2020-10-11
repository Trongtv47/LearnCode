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

        imgView.downloaded(from: baseImgUrl + data.img, contentMode: .scaleAspectFill)
        imgView.layer.cornerRadius = imgView.frame.height / 2
        lblName.text = data.localizedName
    }
    
  
}
