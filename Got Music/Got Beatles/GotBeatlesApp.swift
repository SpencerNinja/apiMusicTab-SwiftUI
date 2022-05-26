//
//  Got_MusicApp.swift
//  Got Music
//
//  Created by Spencer Hurd on 5/25/22.
//

import SwiftUI

@main
struct GotBeatlesApp: App {
    
    @StateObject var songAPI: SongsViewModel = SongsViewModel()
    
    var body: some Scene {
        WindowGroup {
            SongsView()
                .environmentObject(songAPI)
        }
    }
}

/**
 Source of photo: https://www.pexels.com/photo/photo-of-roadway-cross-between-buildings-922690/
 
 API source: https://www.songsterr.com/a/wa/api/?ref=apilist.fun
 */
