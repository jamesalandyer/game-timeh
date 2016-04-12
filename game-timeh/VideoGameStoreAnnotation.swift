//
//  VideoGameStoreAnnotation.swift
//  game-timeh
//
//  Created by James Dyer on 4/12/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

import Foundation
import MapKit

class VideoGameStoreAnnotation: NSObject, MKAnnotation {
    
    var title: String?
    var subtitle: String?
    var coordinate = CLLocationCoordinate2D()
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
