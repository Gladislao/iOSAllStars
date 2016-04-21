//
//  ProfileTableViewController.swift
//  AllStars
//
//  Created by Rodrigo Gonzalez on 4/6/16.
//  Copyright © 2016 Belatrix. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableHeaderView = tableHeader()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: UIBarButtonItemStyle.Done, target: self, action: "logout")
        
    }

    func logout() {
        guard let loginScreen = Utils.loginScreen() else {
            return
        }
        Utils.cleanSession()
        self.presentViewController(loginScreen, animated: true, completion: nil)
    }
    
    var tableViewHeaderHeight : CGFloat {
        get {
            return self.tableView.frame.width / 2
        }
    }
    
    var profileIconSize : CGFloat {
        get {
            return tableViewHeaderHeight / 2
        }
    }

    let offset : CGFloat = 15
    
    func tableHeader() -> UIView {
        let headerView = UIView(frame: CGRect(x: self.tableView.frame.origin.x, y: self.tableView.frame.origin.y, width: self.tableView.frame.width, height: tableViewHeaderHeight))
        
        var profileIconFrame = CGRect()
        profileIconFrame.size.height = profileIconSize
        profileIconFrame.size.width = profileIconSize
        profileIconFrame.origin.x = self.tableView.frame.width / 2 - profileIconSize / 2
        profileIconFrame.origin.y = profileIconSize / 3
        
        let profileIconView = UIImageView(frame: profileIconFrame)
        
        if let profileProfileIcon = UIImage(named: "profile") {
            profileIconView.layer.cornerRadius = (profileIconView.bounds.size.width/2)
            profileIconView.layer.borderWidth = 1.0
            profileIconView.layer.borderColor = UIColor.blackColor().CGColor
            profileIconView.clipsToBounds = true
            profileIconView.image = profileProfileIcon
        }
        
        let profileName = UILabel()
        
        profileName.text = "Mario"
        
        profileName.backgroundColor = .clearColor()

        profileName.sizeToFit()
        
        var profileNameFrame = profileName.frame
        profileNameFrame.origin.y = profileIconFrame.origin.y + profileIconFrame.size.height + offset
        profileNameFrame.origin.x = (profileIconFrame.origin.x + profileIconSize / 2) - profileNameFrame.width / 2
        profileName.frame = profileNameFrame
        

        headerView.addSubview(profileIconView)
        headerView.addSubview(profileName)

        headerView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.5)
        return headerView
    }
    
    @IBAction func starPressed(sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Stars", bundle: nil)
        let recommendVC = storyboard.instantiateViewControllerWithIdentifier("recommendVC")
        presentViewController(recommendVC, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
