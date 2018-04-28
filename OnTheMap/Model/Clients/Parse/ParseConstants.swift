//
//  ParseConstants.swift
//  OnTheMap
//
//  Created by akhil mantha on 28/04/18.
//  Copyright © 2018 akhil mantha. All rights reserved.
//

extension ParseClient{
    
    
    //Mark: Constants
    
    struct Constants{
        
        static let ApiScheme = "https"
        static let ApiHost = "parse.udacity.com"
        static let ApiPath = "/parse/classes"
    }

    
    //Mark: Header keys
    
    struct HeaderKeys{
        static let ApplicationID = ""
        static let ApiKey = ""
    }
    
    //Mark: Methods
    
    struct Methods {
        static let StudentLocation = "/StudentLocation"
        static let StudentLocationPut = "/StudentLocation/{id}"
    }
    
    //Mark: URL Keys
    struct URLKeys{
        static let ObjectId = "id"
    }
    
    //Mark: Parameter Keys
    struct ParameterKeys {
        static let StudentLocationLimit = "limit"
        static let StudentLocationSkip = "skip"
        static let StudentLocationOrder = "order"
        static let StudentLocationWhere = "where"
        static let studentLocationObjectId = "objectId"
        static let StudentLocationLimitDefault = 100
        static let StudentLocationSkipDefault = 400
        static let StudentLocationOrderDefault = "-updatedAt"
    }
    
    //Mark: JSON Response Keys
    struct JSONResponseKeys {
        
        //get students locations
        static let Results = "results"
        
        static let UniqueKey = "uniqueKey"
        static let CreatedAt = "createdAt"
        static let FirstName = "firstName"
        static let LastName = "lastName"
        static let MapString = "mapString"
        static let MediaURL = "mediaURL"
        static let Latitude = "latitude"
        static let Longitude = "longitude"
        static let ObjectId = "objectId"
        static let UpdatedAt = "updatedAt"
    }
}
