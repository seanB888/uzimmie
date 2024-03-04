//
//  Colors.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 1/31/24.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("Accent")
    let armyGreen = Color("ArmyGreen")
    let background = Color("LightGray")
    let bluee = Color("Bluee")
    let darrkGray = Color("DarrkGray")
    let mustard = Color("Mustard")
    let navyBlue = Color("NavyBlue")
    let reed = Color("Reed")
    let yeellow = Color("Yeellow")
    let lightGray = Color("LightGray")
    let hematite = Color("Hematite")
    
    func color(from name: String) -> Color {
        switch name {
        case "accent": return accent
        case "armyGreen": return armyGreen
        case "bluee": return bluee
        case "darrkGray": return darrkGray
        case "mustard": return mustard
        case "navyBlue": return navyBlue
        case "reed": return reed
        case "yeellow": return yeellow
        case "hematite": return hematite
        default: return background
        }
    }
}

