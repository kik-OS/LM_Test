//
//  ProductBlock.swift
//  LM_Test
//
//  Created by Никита Гвоздиков on 19.04.2021.
//

import Foundation

struct ProductBlock {
    let products: [Product]
    let titleOfBlock: String
}

struct Product {
    let title: String
    let price: Int
    let image: String
}


extension ProductBlock {
    static func getProductBlocks() -> [ProductBlock] {
        
        let products = DataManager.shared.products
        let blockTitles = DataManager.shared.blockTitle
        var productBlocks: [ProductBlock] = []
        
        for blockTitle in blockTitles {
            productBlocks.append(ProductBlock(products: products.shuffled(), titleOfBlock: blockTitle))
        }
        return productBlocks
    }
}
   
