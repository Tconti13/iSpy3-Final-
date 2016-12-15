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
    @IBOutlet weak var backgroundLevel01: UIImageView!
    @IBOutlet weak var viewLevel01: UIView!
    @IBOutlet weak var itemsLeft01: UILabel!
    //The Item List(Deer, Duck, Seagull, Chicken, Padlock, Octopus)
    @IBOutlet weak var deerLevel01: UILabel!
    @IBOutlet weak var seagullLevel01: UILabel!
    @IBOutlet weak var duckLevel01: UILabel!
    @IBOutlet weak var octopusLevel01: UILabel!
    @IBOutlet weak var padLockLevel01: UILabel!
    @IBOutlet weak var chickenLevel01: UILabel!
    //The Hidden Objects(Deer, Duck, Seagull, Chicken, Padlock, Octopus)
    @IBOutlet weak var spyDeer01: Level01SpyLabels!
    @IBOutlet weak var spySeagull01: Level01SpyLabels!
    @IBOutlet weak var spyDuck01: Level01SpyLabels!
    @IBOutlet weak var spyOctopus01: Level01SpyLabels!
    @IBOutlet weak var spyPadLock01: Level01SpyLabels!
    @IBOutlet weak var spyChicken01: Level01SpyLabels!
    var spyArray01 = [(Level01SpyLabels, UILabel)]()
    var remaining01 = 6
    var clickable01 = true
    var notClickable01 = false
    var gameOver = false
    var canPlay = false
    override func viewDidLoad() {
        super.viewDidLoad()
        spyArray01.append((spyDeer01, deerLevel01))
        spyArray01.append((spySeagull01, seagullLevel01))
        spyArray01.append((spyDuck01, duckLevel01))
        spyArray01.append((spyOctopus01, octopusLevel01))
        spyArray01.append((spyPadLock01, padLockLevel01))
        spyArray01.append((spyChicken01, chickenLevel01))
        itemsLeft01.text = "There is 6 object(s) remaining!"
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
        self.itemsLeft01.text = "Game Over"
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Reset", style: .default) {
            (action) -> Void in self.resetGame()
            self.itemsLeft01.text = "There is 6 object(s) remaining!"
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
            if item.0.frame.contains(sender.location(in: backgroundLevel01 )){
                if item.0.canTap {
                    if(clickable01){
                        remaining01 -= 1
                        itemsLeft01.text = "There is \(remaining01) object(s) remaining!"
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
