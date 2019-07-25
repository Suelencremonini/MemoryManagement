//
//  ClosureReferenceCycleAsParameterViewController.swift
//  MemoryManagement
//
//  Created by Suelen on 25/07/19.
//  Copyright © 2019 Suelen. All rights reserved.
//

import UIKit

/*
 ViewController used to show that there isn't a reference cycle on closures when they are not assigned to a variable

 This situation simulates a call to a service with a closure as a completion handler
 
 When the closure returns, the Bunny instance and the ClosureReferenceCycleAsParameterViewController are deinitialized, even without using self as weak or unowned inside the closure.
 */

class Bunny: NSObject {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        NSLog("deinitializing the bunny %@", name)
    }
    
    func bunnyJumpingTime(completion: (_ time: Int) -> ()) {
        sleep(5)
        completion(2)
    }
}

class ClosureReferenceCycleAsParameterViewController: UIViewController {
    
    var bunny: Bunny!
    var bunnyJumpingTime: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bunny = Bunny(name: "Bugs Bunny")
    }
    
    deinit {
        NSLog("deinitializing the ClosureReferenceCycleAsParameterViewController")
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        DispatchQueue.global(qos: .background).async {
            self.bunny.bunnyJumpingTime { (time) in
                self.bunnyJumpingTime = time
            }
        }
    }
}
