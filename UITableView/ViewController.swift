//
//  ViewController.swift
//  UITableView
//
//  Created by Gary on 2/12/2015.
//  Copyright © 2015 from The Loft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var customTableView: UITableView!
    @IBOutlet weak var customTableViewBGColor: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set Navigation Bar to a Background Image
        let navBackgroundImage:UIImage! = UIImage(named: "UINavigationBarBGColor")
        [UINavigationBar.appearance().setBackgroundImage(navBackgroundImage, forBarMetrics:.Default)]
        
        // Remove Excess Empty Cells
        customTableView.tableFooterView = UIView()

        // Inset the UITableView
        customTableViewInset()
        
        // Hide Scroll Bar
        customTableView.showsVerticalScrollIndicator = false
        
        //Register custom cells to use in uitableview
        let nib1 = UINib(nibName: "customCellOneNIB", bundle: nil)
        customTableView.registerNib(nib1, forCellReuseIdentifier:"customCellOneIdentifier")
        
        let nib2 = UINib(nibName: "customCellTwoNIB", bundle: nil)
        customTableView.registerNib(nib2, forCellReuseIdentifier:"customCellTwoIdentifier")
    }
    
    // Change the Status Bar to Light
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    TABLEVIEW INSETS
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
    func customTableViewInset(){
        customTableView.contentInset = UIEdgeInsetsMake(-600, 0, 0, 0)
    }
    
    /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    GET THE NUMBER OF ROWS AT INDEXPATH FROM ARRAY DEFINED IN 'DATA.SWIFT' FILE
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        var numberOfRows = 0
        numberOfRows = cellTitle.count
        return numberOfRows
    }
    
    /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    CHANGE THE HEIGHT OF THE CELLS
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        var returnValue: CGFloat = 0
        
        if (indexPath.row < 1 ) {returnValue = 125}
        else {returnValue = 74}
        return returnValue
    }
    
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    //  BUILD TABLE CELLS
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Load the top cell
        if (indexPath.row < 1 ) {
            let cell:customCellTwoClass = self.customTableView.dequeueReusableCellWithIdentifier("customCellTwoIdentifier") as! customCellTwoClass
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            return cell
        }
            
        // Load the rest of the Cells
        else {
            let cell:customCellOneClass = self.customTableView.dequeueReusableCellWithIdentifier("customCellOneIdentifier") as! customCellOneClass
            // Load image and data into the tableView cells
            cell.cellImageUIImageView.image = UIImage(named: cellImage[indexPath.row])
            cell.cellTitleLabel.text = cellTitle[indexPath.row]
            cell.cellDescriptionLabel.text = cellDescription[indexPath.row]
            cell.selectionStyle = UITableViewCellSelectionStyle.None // Disable highlighting Cells
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator // Add the Chevron
            
            return cell
        }
    }
    
}

