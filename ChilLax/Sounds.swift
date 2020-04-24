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
    
    var soundExample = SoundInfo(name: "Nezuko's Theme", fileName: "Nezuko's_Theme", placeDescription: "In Japan, where Wisteria flowers bloom", backgroundImage: "breathOfWater")
    var soundExample2 = SoundInfo(name: "Rainstorm", fileName: "rain-noise", placeDescription: "Chestnut Hill Reservoir (Shirley Lin, 2020)", backgroundImage: "resMorning")
    
    // IMPORTANT: get data function
    func getData(completed: @escaping () -> () ) {
        self.soundArray.append(soundExample)
        self.soundArray.append(soundExample2)
    }
}


