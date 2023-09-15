//
//  SecondViewController.swift
//  AmplifyAnalytics
//
//  Created by David Perez Espino on 15/09/23.
//

import UIKit

class SecondViewController: UIViewController {
    
    let helper = TrackEventsHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helper.recordEvent(for: .AppStarted, with: [
            "App initialized": "success second page",
            "User": "anonymous"
        ])
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        helper.recordEvent(for: .AppClosed, with: [
            "App closed": "success second page",
            "User": "anonymous"
        ])
    }
    @IBAction func goBackScreen(_ sender: UIButton) {
        helper.recordEvent(for: .LoadedFirstPage, with: [
            "User goes to": "First page",
            "User": "anonymous"
        ])
        
        dismiss(animated: true)
    }
}
