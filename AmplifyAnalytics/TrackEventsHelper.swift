//
//  TrackEventsHelper.swift
//  AmplifyAnalytics
//
//  Created by David Perez Espino on 15/09/23.
//

import Foundation
import Amplify

enum Events: String {
    case AppStarted = "AppStarted"
    case AppClosed = "AppClosed"
    case LoadedFirstPage = "LoadedFirstPage"
    case LoadedSecondPage = "LoadedSecondPage"
}

class TrackEventsHelper {
    
    func recordEvent(for event: Events, with properties: [String: String]) {
        
        
        var analyticsProperties: AnalyticsProperties = [:]
        
        for (key, value) in properties {
            analyticsProperties[key] = value
        }
        
        let event = BasicAnalyticsEvent(
            name: event.rawValue,
            properties: properties
        )
        
        Amplify.Analytics.record(event: event)
    }
    
    func recordLog(person: Person) {
        let logger = Amplify.Logging.logger(forCategory: "Authentication", forNamespace: "com.bootcampinstitute.amplifyanalytics")
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(person)
            let jsonString = String(data: jsonData, encoding: String.Encoding.utf8)!
            logger.debug(jsonString)
        } catch {
            logger.error("Error encoding person instance")
        }
    }
}

class Person: Codable {
    var firstName: String?
    var lastName: String?
    var age: Int?
    
    
    init (firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
}
