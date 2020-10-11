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
    
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let cellNib = UINib(nibName: cellID, bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: cellID)
    }
    
    
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.hero.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configureData(data: hero[indexPath.row])
        
        return cell
    }
    
   
    
    
}

