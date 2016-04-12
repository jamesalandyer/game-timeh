//
//  GameDetailVC.swift
//  game-timeh
//
//  Created by James Dyer on 4/5/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

import UIKit

class GameDetailVC: UIViewController {
    
    @IBOutlet weak var gameImg: UIImageView!
    @IBOutlet weak var gameTitleLbl: UILabel!
    @IBOutlet weak var gameDescLbl: UILabel!
    @IBOutlet weak var gameLinkLbl: UILabel!
    @IBOutlet weak var gamePlotLbl: UILabel!
    
    var gameSelected: Game!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameImg.clipsToBounds = true
        gameImg.layer.cornerRadius = 15.0
    }
    
    override func viewDidAppear(animated: Bool) {
        gameImg.image = gameSelected.getGameImg()
        gameTitleLbl.text = gameSelected.gameTitle
        gameDescLbl.text = gameSelected.gameDesc
        gameLinkLbl.text = gameSelected.gameLink
        gamePlotLbl.text = gameSelected.gamePlot
    }
    
    @IBAction func backBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
