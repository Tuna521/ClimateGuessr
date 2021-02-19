//
//  EndViewController.swift
//  Tutorial - Single View App
//
//  Created by Wang Zong-Ting on 19.02.2021.
//  Copyright © 2021 Jacque Crossett. All rights reserved.
//

import UIKit

class EndViewController: UIViewController {

    @IBOutlet weak var solutions: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
        solutions.text = "(1) Where possible, switch to renewable sources of energy (such as solar and wind energy) to power our homes and buildings, thus emitting far less heat-trapping gases into the atmosphere.\n(2) Where affordable, conserve energy by replacing old, failing appliances with more energy-efficient models.\n(3) Where practicable, counterbalance our annual carbon dioxide emissions by investing in commercial services that draw down an equal amount of carbon out of the atmosphere, such as through planting trees or carbon capture and storage techniques.\n(4) Reduce food waste by ensuring that you buy only what you will be able to use before it goes bad.\n(5) Turn off electrical appliances — unless absolutely necessary (like fridges, etc) to stop wasting precious energy. Further on, consider \"smart-ifying\" your home with some smart home energy management solutions.\n(6) Use public transportation to reduce the traffic congestion on the streets, which in turn further reduces pollution in cities."
        // Do any additional setup after loading the view.
    }
    


}
