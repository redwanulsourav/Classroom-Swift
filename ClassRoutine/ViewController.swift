//
//  ViewController.swift
//  ClassRoutine
//
//  Created by CSE KUET on 11/26/18.
//  Copyright © 2018 CSE KUET. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if Auth.auth().currentUser != nil{
            self.performSegue(withIdentifier: "loginToHome", sender: nil)
        }
        else{
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLoginClick(_ sender: UIButton) {
        var email:String!=emailField.text;
        var password:String!=passwordField.text;
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginToHome", sender: nil)
            }
        }
    }
    
}

