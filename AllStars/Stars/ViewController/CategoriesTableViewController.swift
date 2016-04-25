//
//  CategoriesTableViewController.swift
//  AllStars
//
//  Created by Gianfranco Yosida on 4/25/16.
//  Copyright © 2016 Belatrix. All rights reserved.
//

import Foundation
import UIKit

class CategoriesTableViewController: UITableViewController {
    
    var categoryPk: UInt?
    var categories = [Category]()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Private
    
    private func getCategories() {
//        showLoadingIndicator()
//        if let categoryPk = categoryPk {
//            CategoryService.getSubcategoryList(categoryPk, onCompletion: { (subcategories, error) in
//                
//            })
//        } else {
//            let employeePk = UInt(Utils.load(Utils.userIdKey))
//            UserService.getEmployeeCategoryList(employeePk!, onCompletion: { (categories, error) in
//                
//            })
//        }
    }
    
    //MARK - TableViewDelegate
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let item = categories[indexPath.item]
//        if let categoryPk = categoryPk {
//            
//        } else {
//            let subcategoriesVC = storyboard?.instantiateViewControllerWithIdentifier("categoriesTableVC") as! CategoriesTableViewController
//            subcategoriesVC.categoryPk = item.pk
//            navigationController?.pushViewController(subcategoriesVC, animated: true)
//        }
    }
    
}
