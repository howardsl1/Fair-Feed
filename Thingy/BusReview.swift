//
//  BusReview.swift
//  Thingy
//
//  Created by Sam Howard on 9/27/20.
//  Copyright © 2020 Sam Howard. All rights reserved.
//

import UIKit

class BusReview: UIViewController {

    @IBOutlet var response: UITextView!
    @IBOutlet var cusReview: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toShared" {
            let destinationController = segue.destination as! SharedView
            destinationController.brespText = response.text!
            destinationController.brevText = cusReview.text!
        }
    }
}
