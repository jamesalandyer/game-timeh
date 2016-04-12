//
//  GameCell.swift
//  game-timeh
//
//  Created by James Dyer on 4/6/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

import UIKit

class GameCell: UITableViewCell {
    
    @IBOutlet weak var gameTitleLbl: UILabel!
    @IBOutlet weak var gameDescLbl: UILabel!
    @IBOutlet weak var gameImg: UIImageView!
    @IBOutlet weak var gameLinkLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        gameImg.layer.cornerRadius = gameImg.frame.width / 2
    }
    
    func configureCell(game: Game) {
        gameTitleLbl.text = game.gameTitle
        gameDescLbl.text = game.gameDesc
        gameImg.image = game.getGameImg()
        gameLinkLbl.text = game.gameLink
    }
}
