//
//  ViewController.swift
//  OnTheMap
//
//  Created by akhil mantha on 25/04/18.
//  Copyright © 2018 akhil mantha. All rights reserved.
//

import UIKit

class MapController: UIViewController, refres {
    
    @IBOutlet var mapView: MKMapView!
    var studentsLocation : [studentLocation] = [StudentLocation]()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        performUIUpdatesOnMain
    }


}

