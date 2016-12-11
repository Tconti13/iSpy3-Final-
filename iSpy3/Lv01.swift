//
//  Lv01.swift
//  iSpy3
//
//  Created by Tconti on 12/8/16.
//  Copyright © 2016 Tconti. All rights reserved.
//

import UIKit

class Lv01: UIViewController {
    
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
    var spyArray = [Level01SpyLabels]()
    var remaining01 = 6
    var clickable01 = true
    var notClickable01 = false
    override func viewDidLoad() {
        super.viewDidLoad()
        spyArray.append(spyDeer01)
        spyArray.append(spySeagull01)
        spyArray.append(spyDuck01)
        spyArray.append(spyOctopus01)
        spyArray.append(spyPadLock01)
        spyArray.append(spyChicken01)
        itemsLeft01.text = "There is 6 object(s) remaining!"
    }
    @IBAction func onLevel01Tapped(_ sender: UITapGestureRecognizer) {
        print("success")
        for item in spyArray{
            if item.frame.contains(sender.location(in: backgroundLevel01 )){
                if item.canTap {
                    if(clickable01){
                    item.backgroundColor = UIColor.green
                    remaining01 -= 1
                    itemsLeft01.text = "There is \(remaining01) object(s) remaining!"
                    }
                //clickable01 = !clickable01
                    item.canTap = false
                    
                
                }
                }
                    //when you want to add a scoreboard. Each point will be deducted if canTap equals false. Accomadate for that

}
}
}
