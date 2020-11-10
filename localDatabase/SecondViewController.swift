//
//  SecondViewController.swift
//  localDatabase
//
//  Created by Korlan Omarova on 11/10/20.
//

import UIKit
import Realm
import RealmSwift


class SecondViewController: UIViewController {
    
  
    @IBOutlet weak var textField: UITextField!
    @IBAction func saveBtn(_ sender: UIButton) {
        let myNotes = Notes()
        myNotes.note = textField.text ?? ""
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(myNotes)
        }
//        print(myNotes.note)
        self.navigationController!.pushViewController(self.storyboard!.instantiateViewController(withIdentifier: "ViewController") as UIViewController, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

