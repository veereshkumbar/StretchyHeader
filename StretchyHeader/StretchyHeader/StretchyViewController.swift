//
//  StretchyViewController.swift
//  StretchyHeader
//
//  Created by Veeresh Kumbar on 11/01/19.
//  Copyright © 2019 Veeresh Kumbar. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

private let headerId = "headerId"


class StretchyViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        setupCollectionViewFlowLayout()
        
        
        setupCollectionView()
        
        
        
    }
    
    fileprivate func setupCollectionView() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
        collectionView.contentInsetAdjustmentBehavior = .never
    }
    
    
    
    
    // comment this method if u dont want blur effect
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let contentOffsetY = scrollView.contentOffset.y
        
        if contentOffsetY > 0 {return}
        
        header.animator.fractionComplete = abs(contentOffsetY) / 100
        
    }
    
    
    fileprivate func setupCollectionViewFlowLayout() {
        //custom layout
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            let padding:CGFloat = 16
            layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
        }
    }
    
    var header:HeaderView!
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as? HeaderView
        
        return header!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 340)
        
    }
    
    
        
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
   override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        cell.backgroundColor = .black
        
        return cell
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width-32, height: 50)
        
    }
    
}
