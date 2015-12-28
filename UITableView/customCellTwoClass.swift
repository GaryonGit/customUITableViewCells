//
//  customCellTwoClass.swift
//  UITableView
//
//  Created by Gary on 11/12/2015.
//  Copyright © 2015 from The Loft. All rights reserved.
//

import UIKit

class customCellTwoClass: UITableViewCell {
    
    @IBOutlet weak var selfieLabel: UILabel!
    @IBOutlet weak var iconContainer: UIView!
    @IBOutlet weak var selfieTop: UIImageView!
    @IBOutlet weak var selfieBottom: UIImageView!
    @IBOutlet weak var circlePulse: UIView!
    
    
    /*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    VARIABLES
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
    var delayStart = 0.500
    var pulseReminder = 0
    
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    //  Put a radius on an angular UIView
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    func makeRadius(){
        iconContainer.layer.cornerRadius = 38
        circlePulse.layer.cornerRadius = 38
    }
    
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    //  Animate the Circle in the top blue cell to scale
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    func circleGrow() {
        self.circlePulse.alpha = 0
        self.iconContainer.transform = CGAffineTransformMakeScale(0.1, 0.1)
        self.iconContainer.alpha = 0
        
        UIView.animateWithDuration(
            1.2,
            delay:0,
            usingSpringWithDamping: 1.800,
            initialSpringVelocity: 5.0,
            options: [],
            animations: {
                self.iconContainer.transform = CGAffineTransformMakeScale(1, 1)
                self.iconContainer.alpha = 1
            }, completion:nil)
    }
    
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    //  Pulse the circle three times
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    func circlePulsing() {
        self.circlePulse.transform = CGAffineTransformMakeScale(1, 1)
        self.circlePulse.alpha = 1
        
        UIView.animateWithDuration(
            1.2,
            delay: 0.700,
            usingSpringWithDamping: 1.800,
            initialSpringVelocity: 5.0,
            options: [],
            animations: {
                self.circlePulse.transform = CGAffineTransformMakeScale(1.8, 1.8)
                self.circlePulse.alpha = 0
            }, completion:{ _ in
                
                if self.pulseReminder <= 1 {
                    self.circlePulsing()
                    self.pulseReminder = self.pulseReminder + 1
                }
                    
                else{
                    //Do nothing
                }
                
            }
        )
    }
    
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    //  Animate up the selfie icons
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    func selfieRise(){
        
        self.selfieTop.transform = CGAffineTransformMakeTranslation(0, 100)
        self.selfieBottom.transform = CGAffineTransformMakeTranslation(0, 100)
        
        UIView.animateWithDuration(
            1.650,
            delay: 0.004 + delayStart,
            usingSpringWithDamping: 1.100,
            initialSpringVelocity: 10.0,
            options: [],
            animations: {
                self.selfieTop.transform = CGAffineTransformMakeTranslation(0, 0)
            }, completion:nil)
        
        UIView.animateWithDuration(
            1.650,
            delay: delayStart,
            usingSpringWithDamping: 1.100,
            initialSpringVelocity: 14.0,
            options: [],
            animations: {
                self.selfieBottom.transform = CGAffineTransformMakeTranslation(0, 0)
            }, completion:nil)
        
    }
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    //  Relado the Animation in the Top Blue Cell
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    @IBAction func reloadCellAnimationDidPress(sender: AnyObject) {
        pulseReminder = 0
        circleGrow()
        selfieRise()
        circlePulsing()
    }
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    //  Execute the functions
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    override func awakeFromNib() {
        super.awakeFromNib()
        circleGrow()
        makeRadius()
        selfieRise()
        circlePulsing()
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
