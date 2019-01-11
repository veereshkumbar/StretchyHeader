//
//  HeaderView.swift
//  StretchyHeader
//
//  Created by Veeresh Kumbar on 11/01/19.
//  Copyright © 2019 Veeresh Kumbar. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    let imageView:UIImageView = {
        let iv = UIImageView(image: UIImage(named: "veer"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
        self.addSubview(imageView)
        imageView.fillSuperview()
        
        
        setupBlurEffect()
        
    }
    
    var animator:UIViewPropertyAnimator!
    
    func setupBlurEffect(){
        
        animator = UIViewPropertyAnimator(duration: 3.0, curve: .linear, animations: { [weak self] in
            let blur = UIBlurEffect(style: .regular)
            
            let visualEffect = UIVisualEffectView(effect: blur)
            
            self?.addSubview(visualEffect)
            visualEffect.fillSuperview()
        })
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
