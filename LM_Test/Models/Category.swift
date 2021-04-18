//
//  Category.swift
//  LM_Test
//
//  Created by Никита Гвоздиков on 18.04.2021.
//

import Foundation

struct Category {
    let title: String
    let image: String
}

extension Category {
    static func getCategories() -> [Category] {
        DataManager.shared.categories
    }
}
