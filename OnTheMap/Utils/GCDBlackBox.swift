//
//  GCDBlackBox.swift
//  OnTheMap
//
//  Created by akhil mantha on 27/04/18.
//  Copyright © 2018 akhil mantha. All rights reserved.
//

import Foundation

func performUIUpdatesOnMain(_ updates: @escaping () -> Void){
    
    DispatchQueue.main.async {
        updates()
    }
    
}
