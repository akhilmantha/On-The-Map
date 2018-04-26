//
//  ViewController.swift
//  OnTheMap
//
//  Created by akhil mantha on 25/04/18.
//  Copyright © 2018 akhil mantha. All rights reserved.
//

import UIKit

class MapController: UIViewController {
    
    @IBOutlet var mapView: MKMapView!
    var studentsLocation : [studentLocation] = [StudentLocation]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

