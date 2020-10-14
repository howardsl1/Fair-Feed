//
//  SharedView.swift
//  Thingy
//
//  Created by Sam Howard on 9/27/20.
//  Copyright © 2020 Sam Howard. All rights reserved.
//

import UIKit

class SharedView: UIViewController {

    @IBOutlet var state: UILabel!
    @IBOutlet var custPost: UITextView!
    @IBOutlet var busResponse: UITextView!
    @IBOutlet var busReview: UITextView!
    
    var stateText = String()
    var postText = String()
    var brespText = String()
    var brevText = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        state.text = stateText
        custPost.text = postText
        busResponse.text = brespText
        busReview.text = brevText
        // Do any additional setup after loading the view.
    }

}
