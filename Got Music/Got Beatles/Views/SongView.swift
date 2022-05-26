//
//  SongView.swift
//  Got Beatles
//
//  Created by Spencer Hurd on 5/25/22.
//

import SwiftUI

struct SongView: View {
    
    @EnvironmentObject var songsVM: SongsViewModel
    
    var body: some View {
        WebView(
            url: URL(string: "http://www.songsterr.com/a/wa/song?id=\(songsVM.songId)")!
        )
        .background(
            Image("pexels-922690-lukas-rychvalsky")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
    }
}

struct SongView_Previews: PreviewProvider {
    static var previews: some View {
        SongView()
            .environmentObject(SongsViewModel())
    }
}
