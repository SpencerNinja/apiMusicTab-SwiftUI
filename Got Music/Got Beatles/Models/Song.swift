//
//  Books.swift
//  Got Music
//
//  Created by Spencer Hurd on 5/25/22.
//

import Foundation

struct Song: Codable, Identifiable {
    let id: Int
    let type, title: String
    let artist: Artist
    let chordsPresent: Bool
    let tabTypes: [String]
}

struct Artist: Codable {
    let id: Int
    let type, nameWithoutThePrefix: String
    let useThePrefix: Bool
    let name: String
}
