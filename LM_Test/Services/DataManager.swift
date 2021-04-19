//
//  DataManager.swift
//  LM_Test
//
//  Created by Никита Гвоздиков on 18.04.2021.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    let products: [Product] = [Product(title: "Штукатурка механизированная гипсовая Knauf МП 75 ", price: 337, image: "1"),
                               Product(title: "Бетоносмеситель Калибр «Земляк» БСЭ-200, 200 л", price: 14338, image: "2"),
                               Product(title: "Пескобетон Axton 30 кг", price: 143, image: "3"),
                               Product(title: "Экструдированный пенополистирол Т-15 50 мм", price: 232, image: "4"),
                               Product(title: "Утеплитель Роквул Стандарт 50", price: 654, image: "5"),
                               Product(title: "Штукатурка гипсовая Knauf Ротбанд 30 кг", price: 413, image: "6"),
                               Product(title: "Штукатурка гипсовая Unis Теплон 30 кг", price: 318, image: "7"),
                               Product(title: "Грунтовка глубокого проникновения Knauf Тифенгрунд 10 л", price: 716, image: "8")]
    
    let categories: [Category] = [Category(title: "Каталог", image: "25"),
                                  Category(title: "Сад", image: "24"),
                                  Category(title: "Освещение", image: "23"),
                                  Category(title: "Инструменты", image: "22"),
                                  Category(title: "Декор", image: "20"),
                                  Category(title: "Стройматериалы", image: "21")]
    
    let blockTitle = ["Недавно просмотренные", "Предложение ограничено", "Лучшая цена"]
    
    private init() {}
}
