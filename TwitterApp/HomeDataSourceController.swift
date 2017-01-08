//
//  HomeDataSourceController.swift
//  TwitterApp
//
//  Created by Dante Solorio on 1/7/17.
//  Copyright © 2017 iOS México School. All rights reserved.
//

import LBTAComponents

class HomeDataSourceController: DatasourceController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeDataSource = HomeDataSource()
        self.datasource = homeDataSource
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
}
