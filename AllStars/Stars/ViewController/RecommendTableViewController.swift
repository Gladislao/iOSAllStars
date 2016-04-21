//
//  RecommendTableViewController.swift
//  AllStars
//
//  Created by Gianfranco Yosida on 4/21/16.
//  Copyright © 2016 Belatrix. All rights reserved.
//

import Foundation
import UIKit

class RecommendTableViewController: UITableViewController, RecommendDelegate {
    
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var doneBarButtonItem: UIBarButtonItem!
    
    var user: User!
    var comment: String? {
        didSet {
            enableDoneButton()
        }
    }
    var subcategory: Category? {
        didSet {
            enableDoneButton()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    private func initViews() {
        userNameLabel.text = user.getFullName()
        doneBarButtonItem.enabled = false
    }
    
    @IBAction func donePressed(sender: UIBarButtonItem) {
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        switch indexPath.item {
//        case 1:
//        case 2:
//        }
    }
    
    func onCommentFilled(comment: String) {
        self.comment = comment
        commentLabel.text = comment
    }
    
    func onSubcategorySelected(subcategory: Category) {
        self.subcategory = subcategory
        categoryLabel.text = subcategory.name
    }
    
    func enableDoneButton() {
        if subcategory != nil {
            doneBarButtonItem.enabled = true
        }
    }
}

protocol RecommendDelegate {
    
    func onCommentFilled(comment: String)
    func onSubcategorySelected(subcategory: Category)
    
}