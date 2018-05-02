//
//  ViewController.swift
//  OnTheMap
//
//  Created by akhil mantha on 25/04/18.
//  Copyright © 2018 akhil mantha. All rights reserved.
//

import MapKit

class MapController: UIViewController {
    
    @IBOutlet var mapView: MKMapView!
    var studentsLocation : [StudentLocation] = [StudentLocation]()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        performUIUpdatesOnMain{
            self.refresh()
        }
    }


}

