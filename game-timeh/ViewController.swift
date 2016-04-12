//
//  ViewController.swift
//  game-timeh
//
//  Created by James Dyer on 4/5/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainGameImg: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainGameImg.layer.cornerRadius = mainGameImg.frame.width / 2
        mainGameImg.clipsToBounds = true
    }

}

