//
//  SharedView.swift
//  Thingy
//
//  Created by Sam Howard on 9/27/20.
//  Copyright © 2020 Sam Howard. All rights reserved.
//

import UIKit
import RealmSwift

class SharedView: UIViewController {

    @IBOutlet var state: UILabel!
    @IBOutlet var custPost: UITextView!
    @IBOutlet var busResponse: UITextView!
    @IBOutlet var busReview: UITextView!
    
    var stateText = String()
    var postText = String()
    var brespText = String()
    var brevText = String()
    var disputed = false
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        render1()
        render2()
        let badState = "Bad"
        if badState == state.text {
            disputed = true
            save()
        } else {
            save()
        }
        if busResponse.text.isEmpty && busReview.text.isEmpty && badState == "Bad" {
            
        } else {
            saveNewState()
            displayNewState()
        }
       
        // Do any additional setup after loading the view.
    }
    
    func render1() {
        let data = try! realm.objects(Data.self)
        for post in data {
            custPost.text = post.u1post
            state.text = post.state

        }
    }
    
    func render2() {
        let data = try! realm.objects(Data2.self)
        for post in data {

            busResponse.text = post.businessResp
            busReview.text = post.businessRev
        }
    }
    
    func save() {
        let data = Disputed()
        data.disputedAlert = disputed
        realm.beginWrite()
        realm.add(data)
        try! realm.commitWrite()
    }
    
    func saveNewState() {
        let saveState = Data()
        saveState.state = "Disputed"
        saveState.u1post = custPost.text
        realm.beginWrite()
        realm.add(saveState)
        try! realm.commitWrite()
    }
    
    func displayNewState() {
        let data = try! realm.objects(Data.self)
        for item in data {
            state.text = item.state
            custPost.text = item.u1post
        }
    }
    
}
