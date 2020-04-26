//
//  Sounds.swift
//  ChilLax
//
//  Created by Kelvin Cheng on 4/23/20.
//  Copyright © 2020 Kelvin Cheng. All rights reserved.
//

import Foundation

class Sounds {
    var soundArray: [SoundInfo] = []
    var favoritesSoundArray: [SoundInfo] = []
    
    var soundExample = SoundInfo(name: "Nezuko's Theme", fileName: "Nezuko's_Theme", placeDescription: "In Japan, where Wisteria flowers bloom", backgroundImage: "wisteria", liked: true)
    var soundExample2 = SoundInfo(name: "Rainstorm", fileName: "rain-noise", placeDescription: "Chestnut Hill Reservoir (Shirley Lin, 2020)", backgroundImage: "resMorning", liked: false)
    
    // IMPORTANT: get data function
    func getData(completed: @escaping () -> () ) {
        self.soundArray.append(soundExample)
        self.soundArray.append(soundExample2)
    }
    
    func saveData() {
        let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let documentURL = directoryURL.appendingPathComponent("sounds").appendingPathExtension("json")
        let jsonEncoder = JSONEncoder()
        let data = try? jsonEncoder.encode(soundArray)
        do {
            try data?.write(to: documentURL, options: .noFileProtection)
        } catch {
            print("Error could not save data: \(error.localizedDescription)")
        }
    }
    
    func loadData(completed: @escaping () -> () ) {
        let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let documentURL = directoryURL.appendingPathComponent("sounds").appendingPathExtension("json")

        guard let data = try? Data(contentsOf: documentURL) else {return}
        let jsonDecoder = JSONDecoder()
        do {
            soundArray = try jsonDecoder.decode(Array<SoundInfo>.self, from: data)
        } catch {
            print("Error could not load data: \(error.localizedDescription)")
        }
        completed()
    }
}


