//
//  ClosureReferenceCycleAsVarViewController.swift
//  MemoryManagement
//
//  Created by Suelen on 24/07/19.
//  Copyright © 2019 Suelen. All rights reserved.
//

import UIKit

/*
 ViewController used to show a reference cycle created with a closure
 
 The Dog instance holds a reference to the closure stored in the var compliment.
 The closure stored in the var compliment also holds a reference to the Dog instance by using self
 
 So, the Dog instance keeps compliment alive and compliment keeps the Dog instance alive, causing a strong reference cycle
 
 To solve this problem, use self inside the closure as weak or unowned
 */

class Dog: NSObject {
    
    let name: String
    
    // using unowned self inside the closure breaks the reference cycle
    lazy var compliment: () -> String = { [unowned self] in
        return "Who is the good boy? \(self.name) is the good boy!"
    }
    
//    lazy var compliment: () -> String = {
//        return "Who is the good boy? \(self.name) is the good boy!"
//    }
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        NSLog("deinitializing the dog named %@", name)
    }
}

class ClosureReferenceCycleAsVarViewController: UIViewController {

    var myDog: Dog?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myDog = Dog(name: "Max")
    }

    @IBAction func buttonTapped(_ sender: Any) {
        NSLog(myDog?.compliment() ?? "")
        myDog = nil
    }
    
    deinit {
        NSLog("deinitializing the ClosureReferenceCycleAsVarViewController")
    }
}
