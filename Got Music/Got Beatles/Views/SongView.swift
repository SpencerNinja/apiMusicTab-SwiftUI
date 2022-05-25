//
//  SongView.swift
//  Got Beatles
//
//  Created by Spencer Hurd on 5/25/22.
//

import SwiftUI

struct SongView: View {
    
    @EnvironmentObject var songsVM: SongsViewModel
    @State private var songs = [Song]()
    
    var body: some View {
        WebView(
            url: URL(string: "http://www.songsterr.com/a/wa/song?id=\(songsVM.songId)")!
        )
    }
}

struct SongView_Previews: PreviewProvider {
    static var previews: some View {
        SongView()
    }
}
