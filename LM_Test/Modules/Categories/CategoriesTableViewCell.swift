//
//  CategoriesTableViewCell.swift
//  LM_Test
//
//  Created by Никита Гвоздиков on 19.04.2021.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak private var categoriesCollectionView: UICollectionView!
    
    // MARK: - Properties
    
    private var categories: [Category] = []
    
    // MARK: - Actions
    
    func configure(categories: [Category]) {
        self.categories = categories
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        setLayout()
    }
    
    // MARK: - Private methods
    
    private func setLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: self.frame.width / 3 - 20, height: self.frame.width / 3 - 20)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 5, right: 15)
        categoriesCollectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
}

// MARK: - Extensions

    extension CategoriesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "categoriesCell", for: indexPath) as? CategoriesCollectionViewCell else { return UICollectionViewCell() }
        let category = categories[indexPath.row]
        
        if indexPath.row == 0 {
            cell.contentView.backgroundColor = #colorLiteral(red: 0.3695557117, green: 0.7910687923, blue: 0.3164694309, alpha: 1)
            cell.descriptionLabel.textColor = .white
        } else {
            cell.contentView.backgroundColor = #colorLiteral(red: 0.9569190145, green: 0.9608086944, blue: 0.9688851237, alpha: 1)
            cell.descriptionLabel.textColor = .black
        }
        cell.descriptionLabel.text = category.title
        cell.productImage.image = UIImage(named: "\(category.image).jpg")
        cell.contentView.layer.cornerRadius = 5
        return cell
    }

}
