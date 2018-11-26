//
//  registerViewController.swift
//  ClassRoutine
//
//  Created by CSE KUET on 11/26/18.
//  Copyright © 2018 CSE KUET. All rights reserved.
//

import UIKit
import Firebase
class registerViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBOutlet weak var rollTextField: UITextField!
    var ref: DatabaseReference!
    @IBAction func onRegisterClick(_ sender: UIButton) {
        ref = Database.database().reference()
        var email:String! = emailTextField.text
        var password:String! = passwordField.text
        var confirmedPassword:String! = confirmPasswordField.text
        var data:String!
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in

            guard let user = authResult?.user else { return }
            var data = ["roll":self.rollTextField.text,
                        "first_name":self.firstNameTextField.text,
                        "last_name":self.lastNameTextField.text]
            self.ref.child("users").child(user.uid).setValue(data)
            
            self.performSegue(withIdentifier: "registerToHome", sender: nil)
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
