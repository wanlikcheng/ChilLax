//
//  ViewController.swift
//  ChilLax
//
//  Created by Kelvin Cheng on 4/22/20.
//  Copyright © 2020 Kelvin Cheng. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var sounds = ["Forest Breeze", "Oceanside Waves", "Rainstorm", "Music"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sounds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = sounds[indexPath.row]
        return cell
    }
    
    
}

