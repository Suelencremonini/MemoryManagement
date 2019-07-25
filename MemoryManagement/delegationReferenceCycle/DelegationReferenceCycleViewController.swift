//
//  DelegationReferenceCycleViewController.swift
//  MemoryManagement
//
//  Created by Suelen on 23/07/19.
//  Copyright © 2019 Suelen. All rights reserved.
//

import UIKit

/*
 ViewController used to show a reference cycle created with a delegate
 
 The DelegationReferenceCycleViewController keeps a strong reference to an instance of Cat (cat). This means that the cat isn't deallocated as long as the DelegationReferenceCycleViewController is alive
 The cat also keeps a strong reference to its delegate. In this case, the DelegationReferenceCycleViewController is the cat's delegate, which means the DelegationReferenceCycleViewController won't be deallocated as long as the cat is alive
 
 So, the Cat instance keeps DelegationReferenceCycleViewController alive and DelegationReferenceCycleViewController keeps the Cat instance alive, causing a strong reference cycle
 
 To solve this problem, make sure the var delegate (inside Cat) is weak.
 */

protocol CatProtocol: class {
    func catWantsMilk()
}

class Cat: NSObject {
    // defining the delegate as weak breaks the reference cycle
//    weak var delegate: CatProtocol!
    var delegate: CatProtocol!
    
    func callProtocol() {
        delegate.catWantsMilk()
    }
}

class DelegationReferenceCycleViewController: UIViewController {
    
    var cat = Cat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cat.delegate = self
    }
    
    deinit {
        NSLog("deinitializing the DelegationReferenceCycleViewController")
    }

    @IBAction func buttonTapped(_ sender: Any) {
        cat.callProtocol()
    }
}

extension DelegationReferenceCycleViewController: CatProtocol {
    func catWantsMilk() {
        NSLog("cat wants milk!")
    }
}
