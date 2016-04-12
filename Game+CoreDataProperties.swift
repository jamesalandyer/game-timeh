//
//  Game+CoreDataProperties.swift
//  game-timeh
//
//  Created by James Dyer on 4/11/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Game {

    @NSManaged var gameDesc: String?
    @NSManaged var gameLink: String?
    @NSManaged var gamePicture: NSData?
    @NSManaged var gamePlot: String?
    @NSManaged var gameTitle: String?

}
