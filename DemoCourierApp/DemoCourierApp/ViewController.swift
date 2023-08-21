//
//  ViewController.swift
//  DemoCourierApp
//
//  Created by Margels on 14/07/23.
//

import UIKit
import Foundation
import FirebaseAuth
import Courier_iOS

class ViewController: UIViewController {
    
    private lazy var helloWorldLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello, World!"
        return label
    }()
    
    let userId = Constants.userId
    let myAccessToken = "ACCESS_TOKEN"
    let myClientKey = "CLIENT_KEY"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.setUpUI()
        
        Task {

            try await Courier.shared.signIn(
                accessToken: self.myAccessToken,
                clientKey: self.myClientKey,
                userId: self.userId
            )
            
            Courier.shared.isUserSignedIn ? print("Successfully logged in as \(Courier.shared.userId ?? "[USERNAME_UNAVAILABLE]")") : print("Log in failed.")
            
        }
    }

    private func setUpUI() {
        self.view.addSubview(helloWorldLabel)
        self.setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
        
            helloWorldLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            helloWorldLabel.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor)
        
        ])
    }

}
