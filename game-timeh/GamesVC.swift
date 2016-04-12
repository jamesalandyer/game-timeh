//
//  GamesVC.swift
//  game-timeh
//
//  Created by James Dyer on 4/5/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

import UIKit
import CoreData

class GamesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var games = [Game]()
    var gameSelected: Game!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool) {
        fetchAndSetResults()
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "viewDetailSegue" {
            let gameDetailVC = segue.destinationViewController as! GameDetailVC
            let cell = sender as! GameCell
            let point = cell.convertPoint(CGPointZero, toView:tableView)
            let indexPath = tableView.indexPathForRowAtPoint(point)
            gameDetailVC.gameSelected = games[indexPath!.row]
        }
    }
    
    func fetchAndSetResults() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Game")
        
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.games = results as! [Game]
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("GameCell") as? GameCell {
            
            let game = games[indexPath.row]
            cell.configureCell(game)
            return cell
        } else {
            return GameCell()
        }
    }

}
