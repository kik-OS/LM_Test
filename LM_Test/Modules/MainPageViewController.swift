//
//  MainPageVC.swift
//  LM_Test
//
//  Created by Никита Гвоздиков on 18.04.2021.
//

import UIKit

class MainPageViewController: UITableViewController {
    
    var productsBlock: [ProductBlock] = []
    var categories: [Category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.3225129247, green: 0.7715495229, blue: 0.2422060668, alpha: 1)
        setupNavigationBar()
        productsBlock = ProductBlock.getProductBlocks()
        categories = Category.getCategories()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
    }
    
  
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsBlock.count + 1
    }
    
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 0 {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "categoriesCell", for: indexPath) as? CategoriesTableViewCell else { return UITableViewCell() }
    
    cell.configure(categories: categories)
   
  return cell
    } else {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as? ProductsTableViewCell else { return UITableViewCell() }
        cell.configure(productBlock: productsBlock[indexPath.row - 1])
        
        return cell
    }
    
   }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 180
        } else {
            return 300
        }
        
    }
    

     
}

extension MainPageViewController {
    private func setupNavigationBar() {
        title = "Поиск товаров"
        navigationController?.navigationBar.prefersLargeTitles = true
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = #colorLiteral(red: 0.3695557117, green: 0.7910687923, blue: 0.3164694309, alpha: 1)
        //передаем новые параметры в навигейшн бар
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
}
