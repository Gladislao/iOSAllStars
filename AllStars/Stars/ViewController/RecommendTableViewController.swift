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

class RecommendTableViewController: UITableViewController, RecommendDelegate {
    
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var doneBarButtonItem: UIBarButtonItem!
    
    let commentSegue = "commentSegue"
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
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == commentSegue {
            let commentVC = segue.destinationViewController as! AddCommentViewController
            commentVC.recommendDelegate = self
            if let comment = comment {
                if !comment.isEmpty {
                    commentVC.commentText = comment
                }
            }
        } else {
            super.prepareForSegue(segue, sender: sender)
        }
    }
    
    //MARK: - Private
    
    private func initViews() {
        navigationItem.title = "Recommendation"
        userNameLabel.text = "Mario"
//        userNameLabel.text = user.getFullName()
        doneBarButtonItem.enabled = false
    }
    
    private func dismissOnTopVCAndEnableDoneButton() {
        navigationController?.popViewControllerAnimated(true)
        if subcategory != nil {
            doneBarButtonItem.enabled = true
        }
    }
    
    //MARK: - Actions
    
    @IBAction func donePressed(sender: UIBarButtonItem) {
        let userId = UInt(Utils.load(Utils.userIdKey))
        if let userId = userId {
            RecommendService.recommend(userId, toId: user.pk!, subcategory: subcategory!, comment: comment) { (json: AnyObject?, error: NSError?) in
                print(json)
            }
        }
    }
    
    //MARK: -TableViewDelegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.item {
        case 1:
            performSegueWithIdentifier(commentSegue, sender: nil)
            break
        default:
            break
        }
    }
    
    // MARK: -RecommendDelegate
    
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