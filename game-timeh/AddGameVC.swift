//
//  AddGameVC.swift
//  game-timeh
//
//  Created by James Dyer on 4/5/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

import UIKit
import CoreData

class AddGameVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var gameTitle: UITextField!
    @IBOutlet weak var gameDesc: UITextField!
    @IBOutlet weak var gameLink: UITextField!
    @IBOutlet weak var gamePlot: UITextField!
    @IBOutlet weak var gameImg: UIImageView!
    @IBOutlet weak var addGameBtn: UIButton!
    
    var imagePicker: UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        gameImg.layer.cornerRadius = 4.0
        gameImg.clipsToBounds = true
        addGameBtn.layer.cornerRadius = 7.0
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        gameImg.image = image
    }
    
    @IBAction func cancelBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addImgPressed(sender: UIButton!) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
    }

    @IBAction func addGamePressed(sender: AnyObject!) {
        if let title = gameTitle.text where title != "" {
            
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Game", inManagedObjectContext: context)!
            let game = Game(entity: entity, insertIntoManagedObjectContext: context)
            game.gameTitle = title
            game.gameDesc = gameDesc.text
            game.gameLink = gameLink.text
            game.gamePlot = gamePlot.text
            game.setGameImage(gameImg.image!)
            
            context.insertObject(game)
            
            do {
                try context.save()
            } catch {
                print("Could not save game")
            }
            
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
}
