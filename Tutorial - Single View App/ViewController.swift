//
//  ViewController.swift
//  Tutorial - Single View App
//
//  Created by Wang Zong-Ting on 19.02.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
        
    }

    @IBAction func startGame(){
        // do something
        
        let vc = storyboard?.instantiateViewController(identifier: "game") as! GameViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
    }

}

