//
//  Cells.swift
//  TwitterApp
//
//  Created by Dante Solorio on 1/7/17.
//  Copyright © 2017 iOS México School. All rights reserved.
//

import LBTAComponents

class UserFooter: DatasourceCell{
    override func setupViews() {
        super.setupViews()
        backgroundColor = .green
    }
}

class UserHeader: DatasourceCell{
    override func setupViews() {
        super.setupViews()
        backgroundColor = .blue
    }
}

class UserCell: DatasourceCell{
    
    override var datasourceItem: Any?{
        didSet{
            nameLabel.text = datasourceItem as? String
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Test"
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .yellow
        
        addSubview(nameLabel)
        nameLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: -8, widthConstant: 0, heightConstant: 0)
    }
}

