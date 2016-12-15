//
//  Lv01.swift
//  iSpy3
//
//  Created by Tconti on 12/8/16.
//  Copyright © 2016 Tconti. All rights reserved.
//

import UIKit

class Lv01ViewController: UIViewController {
    
    //View, Items Remaining, & Background
    
    @IBOutlet weak var backgroundImageLevel01: UIImageView!
    @IBOutlet weak var viewLevel01: UIView!
    @IBOutlet weak var itemsLeftLabel01: UILabel!
    //The Item List(Deer, Duck, Seagull, Chicken, Padlock, Octopus)
    @IBOutlet weak var deerLabelLevel01: UILabel!
    @IBOutlet weak var seagullLabelLevel01: UILabel!
    @IBOutlet weak var duckLabelLevel01: UILabel!
    @IBOutlet weak var octopusLabelLevel01: UILabel!
    @IBOutlet weak var padLockLabelLevel01: UILabel!
    @IBOutlet weak var chickenLabelLevel01: UILabel!
    //The Hidden Objects(Deer, Duck, Seagull, Chicken, Padlock, Octopus)
    @IBOutlet weak var spyLabelDeer01: Level01SpyLabels!
    @IBOutlet weak var spyLabelSeagull01: Level01SpyLabels!
    @IBOutlet weak var spyLabelDuck01: Level01SpyLabels!
    @IBOutlet weak var spyLabelOctopus01: Level01SpyLabels!
    @IBOutlet weak var spyLabelPadLock01: Level01SpyLabels!
    @IBOutlet weak var spyLabelChicken01: Level01SpyLabels!
    var spyArray01 = [(Level01SpyLabels, UILabel)]()
    var remaining01 = 6
    var clickable01 = true
    var notClickable01 = false
    var gameOver = false
    var canPlay = false
    override func viewDidLoad() {
        super.viewDidLoad()
        spyArray01.append((spyLabelDeer01, deerLabelLevel01))
        spyArray01.append((spyLabelSeagull01, seagullLabelLevel01))
        spyArray01.append((spyLabelDuck01, duckLabelLevel01 ))
        spyArray01.append((spyLabelOctopus01, octopusLabelLevel01))
        spyArray01.append((spyLabelPadLock01, padLockLabelLevel01))
        spyArray01.append((spyLabelChicken01, chickenLabelLevel01))
        itemsLeftLabel01.text = "There is 6 object(s) remaining!"
    }
    func checkForWinner(){
        if remaining01 == 0{
            displayWinningMessage(message: "You've found them all!")
            resetGame()
        }
    }
    func resetGame(){
        for item in spyArray01{
            item.0.canTap = true
            item.1.textColor = UIColor.black
            clickable01 = true
            gameOver = false
            remaining01 = 6
        }
    }
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
    @IBAction func onLevel01Tapped(_ sender: UITapGestureRecognizer) {
        print("success")
        if gameOver{
            return
        }
        for item in spyArray01{
            if item.0.frame.contains(sender.location(in: backgroundImageLevel01 )){
                if item.0.canTap {
                    if(clickable01){
                        remaining01 -= 1
                        itemsLeftLabel01.text = "There is \(remaining01) object(s) remaining!"
                        item.1.textColor = UIColor.green
                        checkForWinner()
                    }
                    item.0.canTap = false
                }
                if item.0.canTap{
                    canPlay = true
                }
            }
        }
    }
}
