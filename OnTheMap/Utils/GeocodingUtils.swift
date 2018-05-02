//
//  GeocodingUtils.swift
//  OnTheMap
//
//  Created by akhil mantha on 02/05/18.
//  Copyright © 2018 akhil mantha. All rights reserved.
//

import CoreLocation
import UIKit

func getCoordinatesForAddress(address: String, vc: UIViewController, _ completionHandlerForGeocoding: @escaping(_ result: CLPlacemark?, _ error: NSError?) -> Void) {
    let geocoder: CLGeocoder = CLGeocoder()
    geocoder.geocodeAddressString(address, completionHandler: {(geocodeResults, geocodeError) in
        
        //geocoder returns an error
        if let error = geocodeError {
            let completionError = NSError(domain: "geoCoordinatesForAddress", code: 0, userInfo: [NSLocalizedDescriptionKey: "Error getting the location"])
            completionHandlerForGeocoding(nil, completionError)
            print("Geocoder error: \(error.localizedDescription). Address String: \(address)")
        }
        
        // the geocoding information is not complete
        guard let results = geocodeResults,
          let _ = results[0].location,
          let _ = results[0].name,
            let _ = results[0].country else {
                let completionError = NSError(domain: "getCoordinatesForAddress", code: 0, userInfo: [NSLocalizedDescriptionKey: "Location not found"])
                completionHandlerForGeocoding(nil, completionError)
                print("Geocoder error: location, address or country not found. Address \(geocodeResults ?? [CLPlacemark]())")
                return
        }
        completionHandlerForGeocoding(results[0], nil)
        
    })
        
        
    }
    
    
    


