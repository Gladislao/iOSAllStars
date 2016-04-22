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
            dismissOnTopVCAndEnableDoneButton()
        }
    }
    var subcategory: Category? {
        didSet {
            dismissOnTopVCAndEnableDoneButton()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    private func initViews() {
        navigationItem.title = "Recommendation"
        userNameLabel.text = user.getFullName()
        doneBarButtonItem.enabled = false
    }
    
    @IBAction func donePressed(sender: UIBarButtonItem) {
        let userId = UInt(Utils.load(Utils.userIdKey))
        if let userId = userId {
            RecommendService.recommend(userId, toId: user.pk!, subcategory: subcategory!, comment: comment) { (json: AnyObject?, error: NSError?) in
                print(json)
            }
        }
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
    
    private func dismissOnTopVCAndEnableDoneButton() {
        dismissViewControllerAnimated(true, completion: nil)
        if subcategory != nil {
            doneBarButtonItem.enabled = true
        }
    }
}

protocol RecommendDelegate {
    
    func onCommentFilled(comment: String)
    func onSubcategorySelected(subcategory: Category)
    
}