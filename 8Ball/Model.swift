//
//  Model.swift
//  8Ball
//
//  Created by Alexandr Kutorai on 26.01.2022.
//

import Foundation

struct Model: Codable {
    let magic: Magic
}

struct Magic: Codable {
    let question, answer, type: String
}

