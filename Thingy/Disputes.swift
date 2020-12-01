//
//  Disputes.swift
//  Thingy
//
//  Created by Sam Howard on 10/27/20.
//  Copyright © 2020 Sam Howard. All rights reserved.
//

import UIKit
import RealmSwift

class Disputes: UIViewController {
    let realm = try! Realm()
    var disputeState: Bool = false
   
    override func viewDidLoad() {
        super.viewDidLoad()
     
        accessData()
        if disputeState == true {
            runAlert()
        }
        // Do any additional setup after loading the view.
    }
    
    func accessData() {
        let data = try! realm.objects(Disputed.self)
        for state in data {
            disputeState = state.disputedAlert
        }
    }
    
    func runAlert() {
        let alert = UIAlertController(title: "Attention", message: "You have 1 new bad review!", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { action -> Void in
            
        })
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }

}
