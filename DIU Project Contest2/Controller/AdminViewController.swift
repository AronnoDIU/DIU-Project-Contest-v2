//
//  AdminViewController.swift
//  DIU Project Contest2
//
//  Created by Yeasir Arafat Aronno on 5/14/19.
//  Copyright © 2019 Yeasir Arafat Aronno. All rights reserved.
//

import UIKit
import Firebase

class AdminViewController: JudgeViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func aboutContest(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "aboutContests", sender: self)
        
    }
    
    @IBAction func manageContact(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "manageContacts", sender: self)
        
    }
    
    @IBAction func addJudges(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "goAddJudges", sender: self)
        
    }
    
    @IBAction func seeProjectData(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "seeProjects", sender: self)
        
    }
    
    
    @IBAction func publishResult(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "publishResults", sender: self)
        
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
