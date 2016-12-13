//
//  Lv02.swift
//  iSpy3
//
//  Created by Tconti on 12/10/16.
//  Copyright © 2016 Tconti. All rights reserved.
//

import UIKit

class Lv02: UIViewController {
    //Background, View, Items Left Label, and Bar for level 02
    @IBOutlet weak var barLeve02: UIImageView!
    @IBOutlet weak var backgroundLevel02: UIImageView!
    @IBOutlet weak var viewLevel02: UIView!
    @IBOutlet weak var itemsLeft02: UILabel!
    //list of items (Monkey, Green Lego, Barrel, Ring, Smiley, Snowcone)
    @IBOutlet weak var monkeyLevel02: UILabel!
    @IBOutlet weak var greenLego02: UILabel!
    @IBOutlet weak var barrel02: UILabel!
    @IBOutlet weak var ringLevel02: UILabel!
    @IBOutlet weak var smileyLevel02: UILabel!
    @IBOutlet weak var snowConeLevel02: UILabel!
    //labels of the hidden items (Monkey, Green Lego, Barrel, Ring, Smiley, Snowcone)
    @IBOutlet weak var spyMonkey02: Level02SpyLabels!
    @IBOutlet weak var spyGreenLego02: Level02SpyLabels!
    @IBOutlet weak var spyBarrel02: Level02SpyLabels!
    @IBOutlet weak var spyRing: Level02SpyLabels!
    @IBOutlet weak var spySmiley02: Level02SpyLabels!
    @IBOutlet weak var spySnowCone02: Level02SpyLabels!
    var spyArray02 = [(Level02SpyLabels, UILabel)]()
    var remaining02 = 6
    var clickable02 = true
    var notClickable02 = false
    var gameOver = false
    var canPlay = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spyArray02.append((spyMonkey02, monkeyLevel02))
        spyArray02.append((spyGreenLego02, greenLego02))
        spyArray02.append((spyBarrel02, barrel02))
        spyArray02.append((spyRing, ringLevel02))
        spyArray02.append((spySmiley02, smileyLevel02))
        spyArray02.append((spySnowCone02, snowConeLevel02))
        itemsLeft02.text = "There is 6 object(s) remaining!"
    }
    func checkForWinner(){
        if remaining02 == 0{
            displayWinningMessage(message: "You've found them all!")
            resetGame()
        }
    }
    func resetGame(){
        for item in spyArray02{
            item.0.canTap = true
            item.1.textColor = UIColor.black
            clickable02 = true
            gameOver = false
            remaining02 = 6
        }
    }
    func displayWinningMessage(message: String){
        self.itemsLeft02.text = "Game Over"
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Reset", style: .default) {
            (action) -> Void in self.resetGame()
            self.itemsLeft02.text = "There is 6 object(s) remaining!"
        }
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
        gameOver = true
    }
    @IBAction func onLevel02Tapped(_ sender: UITapGestureRecognizer) {
        print("success")
        if gameOver{
            return
        }
        for item in spyArray02{
            if item.0.frame.contains(sender.location(in: backgroundLevel02 )){
                if item.0.canTap {
                    if(clickable02){
                        remaining02 -= 1
                        item.1.textColor = UIColor.green
                        itemsLeft02.text = "There is \(remaining02) object(s) remaining!"
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
