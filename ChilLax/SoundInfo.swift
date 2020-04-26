//
//  SoundInfo.swift
//  ChilLax
//
//  Created by Kelvin Cheng on 4/23/20.
//  Copyright © 2020 Kelvin Cheng. All rights reserved.
//

import Foundation

struct SoundInfo: Codable {
    var name: String
    var fileName: String
    var placeDescription: String
    var backgroundImage: String
    var liked: Bool
}
