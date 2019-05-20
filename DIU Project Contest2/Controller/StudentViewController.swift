//
//  StudentViewController.swift
//  DIU Project Contest2
//
//  Created by Yeasir Arafat Aronno on 5/13/19.
//  Copyright © 2019 Yeasir Arafat Aronno. All rights reserved.
//

import UIKit
import Firebase
import ChameleonFramework

class StudentViewController: UIViewController,  UITextFieldDelegate {
    
    
    var projectArray : [Project] = [Project]()
    
    
    @IBOutlet var textfieldMethod: UITextField!
    
    @IBOutlet var textfieldFunction: UITextField!
    
    @IBOutlet var textfieldGitControl: UITextField!
    
    @IBOutlet var textfieldEncapsulation: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textfieldMethod.delegate = self
        textfieldFunction.delegate = self
        textfieldGitControl.delegate = self
        textfieldEncapsulation.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        UIView.animate(withDuration: 0.5){
         self.view.layoutIfNeeded()
      }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        UIView.animate(withDuration: 0.5){
            self.view.layoutIfNeeded()
        }
        
    }
    
//    func retriveProject() {
//        
//    }
    
    
    
    @IBAction func studentSubmit(_ sender: AnyObject) {
        
        textfieldMethod.endEditing(true)
        textfieldFunction.endEditing(true)
        textfieldGitControl.endEditing(true)
        textfieldEncapsulation.endEditing(true)
        
        textfieldMethod.isEnabled = false
        textfieldFunction.isEnabled = false
        textfieldGitControl.isEnabled = false
        textfieldEncapsulation.isEnabled = false
        
        
        let studentDB = Database.database().reference().child("Project")
        
        let studentDictonary = ["Sender": Auth.auth().currentUser?.email,
                                "Method": textfieldMethod.text!,
                                "Function": textfieldFunction.text!,
                                "GitControl": textfieldGitControl.text!,
                                "Encapsulation": textfieldEncapsulation.text!]
        
        studentDB.child("Identifire").setValue(studentDictonary) {
            (error, reference) in
            
            if error != nil {
                print(error!)
            } else {
                print("Data saved successfully!")
            }
            
            Database.database().isPersistenceEnabled = true
            
//            self.projectArray.append(Project) as! String
            
//            self.textfieldMethod.text = self.projectArray[0].method
//            self.textfieldFunction.text = self.projectArray[1].function
//            self.textfieldGitControl.text = self.projectArray[2].gitControl
//            self.textfieldEncapsulation.text = self.projectArray[3].encapsulation
//            self.senderEmail.text = self.projectArray[4].sender
            
        }
        
        
    }
    
//    func retriveProject() {
//
//        let studentDB = Database.database().reference().child("project")
//        studentDB.observe(.childAdded) {
//            (snapshot) in
//
//            let snsapshotValue = snapshot.value as! Dictionary<String,String>
//
//            let method = snsapshotValue["Method"]
//            let function = snsapshotValue["Function"]
//            let gitControl = snsapshotValue["GitControl"]
//            let encapsulation = snsapshotValue["Encapsulation"]
//            let sender = snsapshotValue["Sender"]
//
//        }
//
//
//    }
    
    
    @IBAction func signOutPressed(_ sender: AnyObject) {
        
        do {
            try Auth.auth().signOut()
        }
        catch {
            print("There was a Singout proble occur.")
        }
        
        guard (navigationController?.popToRootViewController(animated: true)) != nil
            else {
                print("No view controller to pop")
                return
        }
        
        Database.database().isPersistenceEnabled = true
        
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
