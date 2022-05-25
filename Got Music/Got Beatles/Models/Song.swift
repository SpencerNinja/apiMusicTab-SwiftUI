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

// API source: https://www.songsterr.com/a/wa/api/?ref=apilist.fun

/** EXAMPLE of data set:
 
 {
     "id": 86376,
     "type": "Song",
     "title": "Yesterday",
     "artist": {
       "id": 19,
       "type": "Artist",
       "nameWithoutThePrefix": "Beatles",
       "useThePrefix": true,
       "name": "The Beatles"
     },
     "chordsPresent": true,
     "tabTypes": [
       "PLAYER",
       "TEXT_GUITAR_TAB",
       "CHORDS",
       "TEXT_BASS_TAB"
     ]
   }
 
 */
