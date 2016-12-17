//
//  Lv01.swift
//  iSpy3
//
//  Created by Tconti on 12/8/16.
//  Copyright © 2016 Tconti. All rights reserved.
//

import UIKit

class Lv01ViewController: UIViewController {
    
    //View, Items Remaining, & Background Outlets.
    @IBOutlet weak var backgroundImageLevel01: UIImageView!
    @IBOutlet weak var viewLevel01: UIView!
    @IBOutlet weak var itemsLeftLabel01: UILabel!
    //The Item List Outlets(Deer, Duck, Seagull, Chicken, Padlock, Octopus).
    @IBOutlet weak var deerLabelLevel01: UILabel!
    @IBOutlet weak var seagullLabelLevel01: UILabel!
    @IBOutlet weak var duckLabelLevel01: UILabel!
    @IBOutlet weak var octopusLabelLevel01: UILabel!
    @IBOutlet weak var padLockLabelLevel01: UILabel!
    @IBOutlet weak var chickenLabelLevel01: UILabel!
    //The Hidden Object Outlets(Deer, Duck, Seagull, Chicken, Padlock, Octopus).
    @IBOutlet weak var spyLabelDeer01: Level01SpyLabels!
    @IBOutlet weak var spyLabelSeagull01: Level01SpyLabels!
    @IBOutlet weak var spyLabelDuck01: Level01SpyLabels!
    @IBOutlet weak var spyLabelOctopus01: Level01SpyLabels!
    @IBOutlet weak var spyLabelPadLock01: Level01SpyLabels!
    @IBOutlet weak var spyLabelChicken01: Level01SpyLabels!
    
    //spyArray 01 contains two labels. Level01SpyLabels contains the spyLabels. UILabel contains the list labels.
    var spyArray01 = [(Level01SpyLabels, UILabel)]()
    
    var remaining01 = 6 //default number of objects to find per level.
    var clickable01 = true //Used during the check for hidden object.
    
    //gameOver and canPlay are used for seeing if the game is ongoing.
    var gameOver = false
    var canPlay = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Adds labels to my spyArray01.
        spyArray01.append((spyLabelDeer01, deerLabelLevel01))
        spyArray01.append((spyLabelSeagull01, seagullLabelLevel01))
        spyArray01.append((spyLabelDuck01, duckLabelLevel01 ))
        spyArray01.append((spyLabelOctopus01, octopusLabelLevel01))
        spyArray01.append((spyLabelPadLock01, padLockLabelLevel01))
        spyArray01.append((spyLabelChicken01, chickenLabelLevel01))
        itemsLeftLabel01.text = "There is 6 object(s) remaining!" //default flavor text that is modified by onLevel01Tapped action.
    }
    
    //This function checks to see if all objects have been found.
    func checkForWinner(){
        if remaining01 == 0{
            displayWinningMessage(message: "You've found them all!")
            resetGame()
        }
    }
    
    //This function, based on if the game is over, brings the game back to its default state.
    func resetGame(){
        for item in spyArray01{
            item.0.canTap = true
            item.1.textColor = UIColor.black
            clickable01 = true
            gameOver = false
            remaining01 = 6
        }
    }
    
    //This function displays the winning message after a game is won via an alert message
    func displayWinningMessage(message: String){
        self.itemsLeftLabel01.text = "Game Over"
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Reset", style: .default) {
            (action) -> Void in self.resetGame()
            self.itemsLeftLabel01.text = "There is 6 object(s) remaining!"
        }
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
        gameOver = true
    }
    
    //This IBAction is a UITapGestureRecognizer.
    @IBAction func onLevel01Tapped(_ sender: UITapGestureRecognizer) {
        
        //If the game is over, it won't iterate
        if gameOver{
            return
        }
        //Iterates through the spyArray01
        for item in spyArray01{
            
            //An if statement that checks if label has been tapped on background
            if item.0.frame.contains(sender.location(in: backgroundImageLevel01 )){
                
                //If the item can be tapped, it subtracts 1 from remaining01 & changes the corresponding list label green
                if item.0.canTap {
                    if(clickable01){
                        remaining01 -= 1
                        itemsLeftLabel01.text = "There is \(remaining01) object(s) remaining!"
                        item.1.textColor = UIColor.green
                        checkForWinner() //checks for winner after each found label
                    }
                    item.0.canTap = false //if remaining01 == 0, canTap becomes false
                }
                
                //If there is still objects to be found, canPlay is true
                if item.0.canTap{
                    canPlay = true
                }
            }
        }
    }
}
