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
        
        setupNavigationBarItems()
        
        let homeDataSource = HomeDataSource()
        self.datasource = homeDataSource
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let user = self.datasource?.item(indexPath) as? User{
            let approximateWithBioTextView = view.frame.width - 12 - 50 - 12 - 2
            let size = CGSize(width: approximateWithBioTextView, height: 1000)
            let attributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
            let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 66)
        }
        
        return CGSize(width: view.frame.width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
}
