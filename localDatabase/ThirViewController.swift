//
//  ThirViewController.swift
//  localDatabase
//
//  Created by Korlan Omarova on 11/10/20.
//

import UIKit
import Realm
import RealmSwift

class ThirViewController: UIViewController {
    var selected = [Notes]()
    @IBOutlet weak var textField: UITextField!
    @IBAction func asd(_ sender: UIButton) {
    
        let realm = try! Realm()
        
//        var myNotes = realm.objects(Notes.self)
        try! realm.write {
            selected[0].note = textField.text!
        }
        
        self.navigationController!.pushViewController(self.storyboard!.instantiateViewController(withIdentifier: "ViewController") as UIViewController, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

  

}
