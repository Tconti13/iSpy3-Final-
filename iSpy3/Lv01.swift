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
    
    

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func onLevel01Tapped(_ sender: UITapGestureRecognizer) {
        print("success")
    }
    
    
    
    
    
}
