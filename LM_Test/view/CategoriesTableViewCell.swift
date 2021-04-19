//
//  CategoriesTableViewCell.swift
//  LM_Test
//
//  Created by Никита Гвоздиков on 19.04.2021.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    

    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    private var categories: [Category] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: categoriesCollectionView.frame.width / 3 - 20, height: categoriesCollectionView.frame.width / 3 - 20)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 5, right: 15)
        categoriesCollectionView.setCollectionViewLayout(flowLayout, animated: true)
    }
    
    func configure(categories: [Category]) {
        self.categories = categories
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        setLayout()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "categoriesCell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        let category = categories[indexPath.row]
        
        if indexPath.row == 0 {
            cell.contentView.backgroundColor = #colorLiteral(red: 0.3695557117, green: 0.7910687923, blue: 0.3164694309, alpha: 1)
            cell.descriptionLabel.textColor = .white
        }
        
        cell.descriptionLabel.text = category.title
        cell.productImage.image = UIImage(named: "\(category.image).jpg")
        
        return cell
    }

}
