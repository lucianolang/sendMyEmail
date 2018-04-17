//
//  ViewController.swift
//  sendMyEmail
//
//  Created by Luciano Gucciardo on 22/01/2018.
//  Copyright © 2018 Luciano Gucciardo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBAction func sendEmailButton(_ sender: Any) {
        APIManager.shared.sendEmail (onSuccess: { (response) in
            DispatchQueue.main.async {
                self.statusLabel.text = response
            }
            
        }, onFailure: { (error) in
            DispatchQueue.main.async {
                self.statusLabel.text = error
            }
        }, email: emailField.text!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

