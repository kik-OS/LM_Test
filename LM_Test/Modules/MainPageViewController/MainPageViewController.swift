//
//  MainPageVC.swift
//  LM_Test
//
//  Created by Никита Гвоздиков on 19.04.2021.
//

import UIKit

class MainPageViewController: UITableViewController {
    
    // MARK: - Properties
    
    private var productsBlock: [ProductBlock] = []
    private var categories: [Category] = []
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productsBlock = ProductBlock.getProductBlocks()
        categories = Category.getCategories()
        setupTableView()
        setupNavigationBar()
    }
    
    // MARK: - Private methods
    
    private func setupNavigationBar() {
        title = "Поиск товаров"
        navigationController?.navigationBar.prefersLargeTitles = true
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.shadowColor = #colorLiteral(red: 0.3695557117, green: 0.7910687923, blue: 0.3164694309, alpha: 1)
        navBarAppearance.backgroundColor = #colorLiteral(red: 0.3695557117, green: 0.7910687923, blue: 0.3164694309, alpha: 1)
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    
    private func setupTableView() {
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsBlock.count + 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "search", for: indexPath) as? CategoriesTableViewCell else { return UITableViewCell() }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "categoriesCell", for: indexPath) as? CategoriesTableViewCell else { return UITableViewCell() }
            cell.configure(categories: categories)
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as? ProductsTableViewCell else { return UITableViewCell() }
            cell.configure(productBlock: productsBlock[indexPath.row - 2])
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0: return 75
        case 1: return view.frame.width / 2.3
        default: return view.frame.width / 1.25
        }
    }
}


