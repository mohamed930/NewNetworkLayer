//
//  RecipesViewController.swift
//  testConnection
//
//  Created by Mohamed Ali on 19/01/2024.
//

import UIKit
import Combine

class RecipesViewController: UIViewController {
    
    var viewmodel = RecipesViewModel()
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
