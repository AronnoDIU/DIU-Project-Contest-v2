//
//  AdminLoginViewController.swift
//  DIU Project Contest2
//
//  Created by Yeasir Arafat Aronno on 5/12/19.
//  Copyright © 2019 Yeasir Arafat Aronno. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class AdminLoginViewController: UIViewController {
    
    @IBOutlet var emailTextfield: UITextField!
    
    @IBOutlet var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func AdminLoginPressed(_ sender: Any) {
        
        SVProgressHUD.show()
        
        
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) {
            (user, error) in
            
            if error != nil {
                print(error!)
            }  else {
                print("Login Successful!")
                
                SVProgressHUD.dismiss()
                
                self.performSegue(withIdentifier: "goToPublishResult", sender: self)
            }
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
