//
//  Lv03.swift
//  iSpy3
//
//  Created by Tconti on 12/10/16.
//  Copyright © 2016 Tconti. All rights reserved.
//

import UIKit

class Lv03ViewController: UIViewController {
    //
    @IBOutlet weak var level03View: UIView!
    @IBOutlet weak var level03Background: UIImageView!
    @IBOutlet weak var level03Bar: UIImageView!
    @IBOutlet weak var itemsLeft03: UILabel!
    //
    @IBOutlet weak var spyElephant03: Level03SpyLabels!
    @IBOutlet weak var greenSmiley03: Level03SpyLabels!
    @IBOutlet weak var purpleAnchor03: Level03SpyLabels!
    @IBOutlet weak var mistletoe03: Level03SpyLabels!
    @IBOutlet weak var vialOfSand03: Level03SpyLabels!
    @IBOutlet weak var handsClasping03: Level03SpyLabels!
    //
    @IBOutlet weak var listElephant03: UILabel!
    @IBOutlet weak var listGreenSmiley: UILabel!
    @IBOutlet weak var listPurpleAnchor: UILabel!
    @IBOutlet weak var listMistletoe03: UILabel!
    @IBOutlet weak var listVialOfSand03: UILabel!
    @IBOutlet weak var listHandsClasping03: UILabel!
    var spyArray03 = [(Level03SpyLabels, UILabel)]()
    var remaining03 = 6
    var clickable03 = true
    var notClickable03 = false
    var gameOver = false
    var canPlay = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spyArray03.append((spyElephant03, listElephant03))
        spyArray03.append((greenSmiley03, listGreenSmiley))
        spyArray03.append((purpleAnchor03, listPurpleAnchor))
        spyArray03.append((mistletoe03, listMistletoe03))
        spyArray03.append((vialOfSand03, listVialOfSand03))
        spyArray03.append((handsClasping03, listHandsClasping03))
        itemsLeft03.text = "There is 6 object(s) remaining!"
    }
    func checkForWinner(){
        if remaining03 == 0{
            displayWinningMessage(message: "You've found them all!")
            resetGame()
        }
    }
    func resetGame(){
        for item in spyArray03{
            item.0.canTap = true
            clickable03 = true
            item.1.textColor = UIColor.black
            gameOver = false
            remaining03 = 6
        }
    }
    func displayWinningMessage(message: String){
        self.itemsLeft03.text = "Game Over"
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Reset", style: .default) {
            (action) -> Void in self.resetGame()
            self.itemsLeft03.text = "There is 6 object(s) remaining!"
        }
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
        gameOver = true
    }
    @IBAction func onViewTapped03(_ sender: UITapGestureRecognizer) {
        print("success")
        if gameOver{
            return
        }
        for item in spyArray03{
            if item.0.frame.contains(sender.location(in: level03Background)){
                if item.0.canTap {
                    if(clickable03){
                        remaining03 -= 1
                        itemsLeft03.text = "There is \(remaining03) object(s) remaining!"
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
