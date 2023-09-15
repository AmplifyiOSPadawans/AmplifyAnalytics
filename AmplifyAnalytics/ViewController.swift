//
//  ViewController.swift
//  AmplifyAnalytics
//
//  Created by David Perez Espino on 15/09/23.
//

import UIKit

class ViewController: UIViewController {

    let helper = TrackEventsHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helper.recordEvent(for: .AppStarted, with: [
            "App initialized": "success",
            "User": "anonymous"
        ])
        
        let person = Person(firstName: "John", lastName: "Doe", age: 25)
        helper.recordLog(person: person)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        helper.recordEvent(for: .AppClosed, with: [
            "App closed": "success",
            "User": "anonymous"
        ])
    }


    @IBAction func goNext(_ sender: Any) {
        performSegue(withIdentifier: "GoNext", sender: self)
    }
}

