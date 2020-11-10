//
//  ViewController.swift
//  localDatabase
//
//  Created by Korlan Omarova on 11/10/20.
//

import UIKit
import Realm
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var realm = try! Realm()
//    var notes = [Notes]()
//    var lol: [Notes] = []
    let s = try! Realm().objects(Notes.self)
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        self.tableView.reloadData()
        
       
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.s.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        let note = s[indexPath.row].note
        cell.cellLabel.text = note
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let object = self.s[indexPath.item]
        if let vc = storyboard?.instantiateViewController(identifier: "ThirViewController") as? ThirViewController{
            vc.selected = [object]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}

