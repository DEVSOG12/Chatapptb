//
//  ViewController.swift
//  chatapptb
//
//  Created by Oreofe Solarin on 31/08/2020.
//  Copyright © 2020 Oreofe Solarin. All rights reserved.
//

import UIKit

class ConversationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        
        let isLoggedin =     UserDefaults.standard.bool(forKey: "logged_in")
        if !isLoggedin {
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false)
            
        }
    }
 
}

