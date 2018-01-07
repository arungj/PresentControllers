//
//  ViewController2.swift
//  PresentControllers
//
//  Created by Arun George on 9/30/17.
//  Copyright © 2017 GJ. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeTouched(_ sender: Any) {
        dismiss(animated: true)
    }
}
