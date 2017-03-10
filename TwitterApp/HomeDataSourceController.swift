//
//  HomeDataSourceController.swift
//  TwitterApp
//
//  Created by Dante Solorio on 1/7/17.
//  Copyright © 2017 iOS México School. All rights reserved.
//

import LBTAComponents
import TRON

class HomeDataSourceController: DatasourceController {
    
    let errorMessageLabel: UILabel = {
       let label = UILabel()
        label.text = "Apologies something went wrong. Please try again later..."
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(errorMessageLabel)
        errorMessageLabel.fillSuperview() // LBTA method call
        
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        setupNavigationBarItems()
        
        Service.sharedInstance.fetchHomeFeed { (homeDataSource, err) in
            if let _ = err{
                self.errorMessageLabel.isHidden = false
                if let apiError = err as? APIError<Service.JSONError>{
                    if apiError.response?.statusCode != 200{
                        self.errorMessageLabel.text = "Status code not 200"
                    }
                }
                return
            }
            
            self.datasource = homeDataSource
        }
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
        if section == 1{
            return .zero
        }
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1{
            return .zero
        }
        return CGSize(width: view.frame.width, height: 64)
    }
}
