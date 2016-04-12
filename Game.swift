//
//  Game.swift
//  game-timeh
//
//  Created by James Dyer on 4/11/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

import Foundation
import CoreData
import UIKit

@objc(Game)
class Game: NSManagedObject {

    func setGameImage(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.gamePicture = data
    }
    
    func getGameImg() -> UIImage {
        let img = UIImage(data: self.gamePicture!)!
        return img
    }

}
