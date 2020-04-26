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
    @IBOutlet weak var displayFavoritesButton: UIBarButtonItem!
    
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
    
    func saveData() {
        sounds.saveData()
    }
    
    var count = 0
    
    @IBAction func favoriteSoundsButtonPressed(_ sender: Any) {
        if count % 2 == 0 {
            print("Displaying liked sounds")
            for s in sounds.soundArray {
                if s.liked {
                    print("\(s.name)")
                }
                sounds.soundArray.sort { $0.liked && !$1.liked }
                displayFavoritesButton.image = UIImage(systemName: "heart.fill")
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            count += 1
        } else {
            print("Displaying all sounds")
            sounds.soundArray.sort { $0.name < $1.name }
            displayFavoritesButton.image = UIImage(systemName: "heart")
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            count += 1
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource, FavoriteTableViewCellDelegate {
    
    func likedButtonToggle(sender: FavoriteTableViewCell) {
        if let selectedIndexPath = tableView.indexPath(for: sender) {
            sounds.soundArray[selectedIndexPath.row].liked = !sounds.soundArray[selectedIndexPath.row].liked
            tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
            saveData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sounds.soundArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FavoriteTableViewCell
        cell.delegate = self
        cell.soundNameLabel.text = sounds.soundArray[indexPath.row].name
        cell.likedButton.isSelected = sounds.soundArray[indexPath.row].liked
//        cell.textLabel?.text = sounds.soundArray[indexPath.row].name
        return cell
    }
    
    
}

