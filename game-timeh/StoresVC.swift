//
//  StoresVC.swift
//  game-timeh
//
//  Created by James Dyer on 4/5/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

import UIKit
import MapKit

class StoresVC: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var map: MKMapView!
    
    let regionRadius: CLLocationDistance = 1000
    
    let locationManager = CLLocationManager()
    
    let addresses = [
        "830 Market St San Francisco CA 94102"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        map.delegate = self
        
        for add in addresses {
            getPlacemarkFromAddress(add)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        locationAuthStatus()
    }
    
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            map.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2, regionRadius * 2)
        map.setRegion(coordinateRegion, animated: true)
    }
    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        if let loc = userLocation.location {
            centerMapOnLocation(loc)
        }
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation.isKindOfClass(VideoGameStoreAnnotation) {
            let annoView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "Default")
            annoView.pinTintColor = UIColor.purpleColor()
            annoView.animatesDrop = true
            annoView.canShowCallout = true
            return annoView
        } else if annotation.isKindOfClass(MKUserLocation) {
            return nil
        }
        
        return nil
    }
    
    
    
    func createAnnotationForLocation(location: CLLocation) {
        let gamestore = VideoGameStoreAnnotation(coordinate: location.coordinate)
        gamestore.title = "GameStop Store"
        gamestore.subtitle = "830 Market Street"
        map.addAnnotation(gamestore)
    }
    
    func getPlacemarkFromAddress(address: String) {
        CLGeocoder().geocodeAddressString(address) { (placemarks: [CLPlacemark]?, error: NSError?) in
            if let marks = placemarks where marks.count > 0 {
                if let loc = marks[0].location {
                   self.createAnnotationForLocation(loc)
                }
            }
        }
    }

}
