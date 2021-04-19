//
//  ProductsTableViewCell.swift
//  LM_Test
//
//  Created by Никита Гвоздиков on 19.04.2021.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {
    // MARK: - Outlets
    
    @IBOutlet weak private var productCollectionView: UICollectionView!
    @IBOutlet weak private var titleLabel: UILabel!
    
    // MARK: - Properties
    
    private var productBlock: ProductBlock?
    
    // MARK: - Actions
    
    func configure(productBlock: ProductBlock) {
        self.productBlock = productBlock
        titleLabel.text = productBlock.titleOfBlock
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        setLayout()
    }
    
    // MARK: - Private methods
    
    private func setLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: self.frame.width / 3 - 20, height: self.frame.width / 3 + 80)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 5, right: 15)
        productCollectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
}

// MARK: - Extensions

extension ProductsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        productBlock?.products.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = productCollectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as? ProductCollectionViewCell else { return UICollectionViewCell() }
        let product = productBlock?.products[indexPath.row]
        cell.productImage.image = UIImage(named: "\(product?.image ?? "").jpg")
        cell.priceLabel.text = String(product?.price ?? 0)
        cell.descriptionLabel.text = product?.title
        return cell
    }
}
