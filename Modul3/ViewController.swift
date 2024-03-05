//
//  ViewController.swift
//  Modul3
//
//  Created by Юрий Кузнецов on 05.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let networkManager = NewsManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.getNews()
    }


}

