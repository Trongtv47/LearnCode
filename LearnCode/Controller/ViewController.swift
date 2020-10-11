//
//  ViewController.swift
//  LearnCode
//
//  Created by Trần Trọng on 10/11/20.
//  Copyright © 2020 Trần Trọng. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let apiConnect = APIConnect()
    
    var hero = [Hero]()
    fileprivate var cellID = "CollectionViewCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        apiConnect.getHero()
        
        apiConnect.completionHandler { [weak self] (hero, status, message) in
            if status {
                guard let self = self else {return}
                guard let _hero = hero else {return}
                self.hero = _hero
                self.collectionView.reloadData()
            }
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let cellNib = UINib(nibName: cellID, bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: cellID)
        
    }
    
    
    
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hero.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configureData(data: hero[indexPath.row])
        
        return cell
    }
    
   //MARK: layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (collectionView.bounds.width - (9*4)) / 3
        return CGSize(width: width, height: width * 1.2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 0, left: 9, bottom: 9, right: 9)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("select = \(hero[indexPath.row].localizedName)")
    }
    
}



