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
//    var sounds = ["Nezuko's Theme", "Oceanside Waves", "Rainstorm", "Music"]
    var sounds = Sounds()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        sounds.getData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowSound" {
            let destination = segue.destination as! SoundViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.soundInfo = sounds.soundArray[selectedIndexPath.row]
        }
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sounds.soundArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = sounds.soundArray[indexPath.row].name
        return cell
    }
    
    
}

