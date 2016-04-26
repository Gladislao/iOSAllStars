//
//  RecommendTableViewController.swift
//  AllStars
//
//  Created by Gianfranco Yosida on 4/21/16.
//  Copyright © 2016 Belatrix. All rights reserved.
//

import Foundation
import UIKit
import UITextView_Placeholder

class GiveStarTableViewController: UITableViewController, RecommendDelegate {
    
    static let commentSegue = "commentSegue"
    static let categoriesSegue = "categoriesSegue"
    
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var doneBarButtonItem: UIBarButtonItem!
    
    let loggedInUserPk = UInt(Utils.load(Utils.userIdKey))!
    var user: User!
    var categories: [Category]?
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
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == GiveStarTableViewController.commentSegue {
            let commentVC = segue.destinationViewController as! StarCommentViewController
            setUpCommentVC(commentVC)
        } else if segue.identifier == GiveStarTableViewController.categoriesSegue {
            let categoriesVC = segue.destinationViewController as! CategoriesTableViewController
            setUpCategoriesVC(categoriesVC)
        } else {
            super.prepareForSegue(segue, sender: sender)
        }
    }
    
    // MARK: - Private
    
    private func initViews() {
        navigationItem.title = "Recommendation"
//      TODO: set the label with the user reference. user.getFullName()
        userNameLabel.text = "Mario"
        doneBarButtonItem.enabled = false
    }
    
    private func dismissOnTopVCAndEnableDoneButton() {
        navigationController?.popToRootViewControllerAnimated(true)
        if subcategory != nil {
            doneBarButtonItem.enabled = true
        }
    }
    
    private func setUpCategoriesVC(categoriesVC: CategoriesTableViewController) {
        categoriesVC.recommendDelegate = self
        categoriesVC.categories = categories
    }
    
    private func setUpCommentVC(commentVC: StarCommentViewController) {
        commentVC.recommendDelegate = self
        if let comment = comment {
            if !comment.isEmpty {
                commentVC.commentText = comment
            }
        }
    }
    
    private func fetchAndDisplayCategories() {
        showLoadingIndicator()
        UserService.getEmployeeCategoryList(loggedInUserPk) { (categories, error) in
            self.hideLoadingIndicator()
            if error == nil {
                self.categories = categories
                self.performSegueWithIdentifier(GiveStarTableViewController.categoriesSegue, sender: nil)
            }
        }
    }
    
    // MARK: - Actions
    
    @IBAction func donePressed(sender: UIBarButtonItem) {
        showLoadingIndicator()
//      TODO: get the pk from the user who will receive the star. user.pk!
        let toUserId: UInt = 2
        StarService.giveStar(loggedInUserPk, toId: toUserId, subcategory: subcategory!, comment: comment, onCompletion: { (star, error) in
            self.hideLoadingIndicator()
            if error == nil {
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        })
    }
    
    @IBAction func cancelPressed(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - TableViewDelegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.item {
        case 1:
            performSegueWithIdentifier(GiveStarTableViewController.commentSegue, sender: nil)
        default:
            fetchAndDisplayCategories()
        }
    }
    
    // MARK: - RecommendDelegate
    
    func onCommentFilled(comment: String) {
        self.comment = comment
        commentLabel.text = comment
    }
    
    func onSubcategorySelected(subcategory: Category) {
        self.subcategory = subcategory
        categoryLabel.text = subcategory.name
    }
    
}

protocol RecommendDelegate {
    
    func onCommentFilled(comment: String)
    func onSubcategorySelected(subcategory: Category)
    
}