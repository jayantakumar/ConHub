//
//  menuItem.swift
//  ConHub
//
//  Created by Jayanta kumar on 02/02/22.
//

import Foundation
import SwiftUI

struct MenuItem:Identifiable {
    let id:String = UUID().uuidString
    let name:String
    let systemImage:String
    let destination:AnyView
}
