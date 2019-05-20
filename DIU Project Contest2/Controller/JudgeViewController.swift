//
//  JudgeViewController.swift
//  DIU Project Contest2
//
//  Created by Yeasir Arafat Aronno on 5/14/19.
//  Copyright © 2019 Yeasir Arafat Aronno. All rights reserved.
//

import UIKit
import Firebase
import ChameleonFramework


class JudgeViewController: StudentViewController {

    
    @IBOutlet var senderView: UILabel!
    
    @IBOutlet var methodView: UILabel!

    @IBOutlet var functionView: UILabel!

    @IBOutlet var gitControlView: UILabel!

    @IBOutlet var encapsulationView: UILabel!
    
    
    
    
    
    
    @IBOutlet var methodMarkView: UITextField!
    
    @IBOutlet var functionMarkView: UITextField!
    
    @IBOutlet var gitControlMarkView: UITextField!
    
    @IBOutlet var encapsulationMarkView: UITextField!
    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        methodMarkView.delegate = self
        functionMarkView.delegate = self
        gitControlMarkView.delegate = self
        encapsulationMarkView.delegate = self
        
        textfieldMethod.delegate = self
        textfieldFunction.delegate = self
        textfieldGitControl.delegate = self
        textfieldEncapsulation.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func retriveProject() {

        let studentDB = Database.database().reference().child("Project")
        studentDB.observe(.childAdded) {
            (snapshot) in

            let snsapshotValue = snapshot.value as! Dictionary<String,String>

            let method = snsapshotValue["Method"]
            let function = snsapshotValue["Function"]
            let gitControl = snsapshotValue["GitControl"]
            let encapsulation = snsapshotValue["Encapsulation"]
            let sender = snsapshotValue["Sender"]
            
            self.senderView.text = sender
            self.methodView.text = method
            self.functionView.text = function
            self.gitControlView.text = gitControl
            self.encapsulationView.text = encapsulation

            let project = Project()

            project.method = self.methodView.text!
            project.function = self.functionView.text!
            project.gitControl = self.gitControlView.text!
            project.encapsulation = self.encapsulationView.text!
            project.sender = self.senderView.text!

            self.projectArray.append(project)
            
            Database.database().isPersistenceEnabled = true

        }


    }

//        let snsapshotValue = snapshot.value as! Dictionary<String,String>
//
//        let method = snsapshotValue["Method"]
//        let function = snsapshotValue["Function"]
//        let gitControl = snsapshotValue["GitControl"]
//        let encapsulation = snsapshotValue["Encapsulation"]
//        let sender = snsapshotValue["Sender"]



//        let project = Project()
//
//        project.method = methodView.text!
//        project.function = functionView.text!
//        project.gitControl = gitControlView.text!
//        project.encapsulation = encapsulationView.text!
//        project.sender = senderView.text!
//
//        self.projectArray.append(project)
//
//
//    }
    
    override func textFieldDidBeginEditing(_ textField: UITextField) {
        
        UIView.animate(withDuration: 0.5){
            self.view.layoutIfNeeded()
        }
    }
    
    override func textFieldDidEndEditing(_ textField: UITextField) {
        
        UIView.animate(withDuration: 0.5){
            self.view.layoutIfNeeded()
        }
        
    }
    
    
    
    
    @IBAction func submitMark(_ sender: AnyObject) {
        
        methodMarkView.endEditing(true)
        functionMarkView.endEditing(true)
        gitControlMarkView.endEditing(true)
        encapsulationMarkView.endEditing(true)
        
        methodMarkView.isEnabled = false
        functionMarkView.isEnabled = false
        gitControlMarkView.isEnabled = false
        encapsulationMarkView.isEnabled = false
        
        let studentDB = Database.database().reference().child("marks")
        
        let studentDictonary = ["Sender": Auth.auth().currentUser?.email,
                                "Method": methodMarkView.text!,
                                "Function": functionMarkView.text!,
                                "GitControl": gitControlMarkView.text!,
                                "Encapsulation": encapsulationMarkView.text!]
        
        studentDB.child("marks").setValue(studentDictonary) {
            (error, reference) in
            
            if error != nil {
                print(error!)
            } else {
                print("Marks saved successfully!")
            }
            
            Database.database().isPersistenceEnabled = true
        
        
    }
        
}
    
    
    
    
    @IBAction override func signOutPressed(_ sender: AnyObject) {
        
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
