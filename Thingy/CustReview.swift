//
//  CustReview.swift
//  Thingy
//
//  Created by Sam Howard on 9/27/20.
//  Copyright © 2020 Sam Howard. All rights reserved.
//

import UIKit

class CustReview: UIViewController {

    @IBOutlet var setControl: UISegmentedControl!
    @IBOutlet var custTextView: UITextView!
    var st1 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "custToPost" {
            let destController = segue.destination as! SharedView
            destController.stateText = st1
            destController.postText = custTextView.text!
        }
    }

    @IBAction func segTapped(_ sender: UISegmentedControl) {
        switch setControl.selectedSegmentIndex {
        case 0:
            st1 = "Good"
        case 1:
            st1 = "Bad"
        default:
            st1 = "Good"
        }
    }
}
