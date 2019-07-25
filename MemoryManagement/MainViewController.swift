//
//  MainViewController.swift
//  MemoryManagement
//
//  Created by Suelen on 23/07/19.
//  Copyright © 2019 Suelen. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBAction func delegationReferenceCycleTapped(_ sender: Any) {
        performSegue(withIdentifier: "DelegationReferenceCycle", sender: self)
    }
    
    @IBAction func closureAsVarReferenceCycleTapped(_ sender: Any) {
        performSegue(withIdentifier: "ClosureReferenceCycleAsVar", sender: self)
    }
    
    @IBAction func classReferenceCycleTapped(_ sender: Any) {
        performSegue(withIdentifier: "ClassReferenceCycle", sender: self)
    }
    @IBAction func closureAsParameterReferenceCycleTapped(_ sender: Any) {
        performSegue(withIdentifier: "ClosureReferenceCycleAsParameter", sender: self)
    }
}

