//
//  ClassReferenceCycleViewController.swift
//  MemoryManagement
//
//  Created by Suelen on 24/07/19.
//  Copyright © 2019 Suelen. All rights reserved.
//

import UIKit

/*
 ViewController used to show a reference cycle created with two classes
 
 The Pet instance holds a strong reference to the Owner instance.
 The Owner instance holds a strong reference to the Pet instance.
 
 So, even it both of them are set to nil, the strong reference between Pet and Owner won't be broken
 
 To solve this problem, define the instance of Pet inside Owner or the instance of Owner inside Pet as weak
 */

class Owner: NSObject {
    var pet: Pet?
    let name: String
    
    init(pet: Pet? = nil, name: String) {
        self.pet = pet
        self.name = name
    }
    
    deinit {
        NSLog("deinitializing the owner named %@", name)
    }
}

class Pet: NSObject {
    // defining the owner as weak breaks the reference cycle
//    weak var owner: Owner?
    var owner: Owner?
    let name: String
    
    init(owner: Owner? = nil, name: String) {
        self.owner = owner
        self.name = name
    }
    
    deinit {
        NSLog("deinitializing the pet named %@", name)
    }
}

class ClassReferenceCycleViewController: UIViewController {

    var pet: Pet?
    var owner: Owner?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pet = Pet(name: "Max")
        owner = Owner(name: "Max's owner")
        
        owner?.pet = pet
        pet?.owner = owner
    }
    
    deinit {
        NSLog("deinitializing the ClassReferenceCycleViewController")
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        owner = nil
        pet = nil
        
    }
}
