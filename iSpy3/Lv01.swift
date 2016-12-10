//
//  Lv01.swift
//  iSpy3
//
//  Created by Tconti on 12/8/16.
//  Copyright © 2016 Tconti. All rights reserved.
//

import UIKit

class Lv01: UIViewController {
    
    //View & Background
    @IBOutlet weak var backgroundLevel01: UIImageView!
    @IBOutlet weak var viewLevel01: UIView!
    
    //The Item List(Deer, Duck, Seagull, Chicken, Padlock, Octopus)
    @IBOutlet weak var listDeer01: Level01ListLabels!
    @IBOutlet weak var listSeaGull01: Level01ListLabels!
    @IBOutlet weak var listDuck01: Level01ListLabels!
    @IBOutlet weak var listOctopus01: Level01ListLabels!
    @IBOutlet weak var listPadLock: Level01ListLabels!
    @IBOutlet weak var listChicken01: Level01ListLabels!
    //The Array that houses the List Labels
    var listArray01 = [Level01ListLabels]()
    
    
    //The Hidden Objects(Deer, Duck, Seagull, Chicken, Padlock, Octopus)
    @IBOutlet weak var spyDeer01: Level01SpyLabels!
    @IBOutlet weak var spySeagull01: Level01SpyLabels!
    @IBOutlet weak var spyDuck01: Level01SpyLabels!
    @IBOutlet weak var spyOctopus01: Level01SpyLabels!
    @IBOutlet weak var spyPadLock01: Level01SpyLabels!
    @IBOutlet weak var spyChicken01: Level01SpyLabels!
    //The Array that houses the Object Labels
    var spyArray = [Level01SpyLabels]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spyArray.append(spyDeer01)
        spyArray.append(spySeagull01)
        spyArray.append(spyDuck01)
        spyArray.append(spyOctopus01)
        spyArray.append(spyPadLock01)
        spyArray.append(spyChicken01)
    }
    @IBAction func onLevel01Tapped(_ sender: UITapGestureRecognizer) {
        print("success")
        for item in spyArray{
            if item.frame.contains(sender.location(in: backgroundLevel01 )){
                if item.canTap {
                    item.backgroundColor = UIColor.green
                    print("object found")
                    //when you want to add a scoreboard. Each point will be deducted if canTap equals false. Accomadate for that
}
}
}
}
}
