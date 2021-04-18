//
//  TableViewCell.swift
//  LM_Test
//
//  Created by Никита Гвоздиков on 18.04.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
     var products : [Product] = []
     var categories : [Category] = []
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var collectionView: UICollectionView!

    var isBigger = false
    
    func configure(isBig: Bool) {
        
        
        
        isBigger = isBig
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let flowLayout = UICollectionViewFlowLayout()
        
        if isBigger {
        flowLayout.itemSize = CGSize(width: 135, height: 215)
        } else {
            flowLayout.itemSize = CGSize(width: 135, height: 135)
        }
        
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        flowLayout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
    
}


extension TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isBigger {
            return products.count
        } else {
            return categories.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if isBigger {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "product", for: indexPath) as! CollectionViewCell
            let product = products[indexPath.row]
            
            cell.image.image = UIImage(named: "\(product.image).jpg")
            cell.paidLabel.text = String(product.price)
            cell.descriptionLabel.text = product.title
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "category", for: indexPath) as! CollectionViewCell
            let category = categories[indexPath.row]
            cell.image.image = UIImage(named: "\(category.image).jpg")
            cell.descriptionLabel.text = category.title
            cell.backgroundColor = #colorLiteral(red: 0.9098134637, green: 0.9137717485, blue: 0.9177312255, alpha: 1)
            return cell
        }
        
    }
}
