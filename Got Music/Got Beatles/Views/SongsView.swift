//
//  BooksView.swift
//  Got Music
//
//  Created by Spencer Hurd on 5/25/22.
//

import SwiftUI

struct SongsView: View {
    
    @State var songs = [Song]()
    
    var body: some View {
        ZStack {
            // background
            
            // content
            VStack {
                Text("Title")
                Text("Pick an instrument")
                HStack {
                    Button(action: {
                        
                    }, label: {
                        Text("Guitar")
                    })
                    Button(action: {
                        
                    }, label: {
                        Text("Bass")
                    })
                    Button(action: {
                        
                    }, label: {
                        Text("Drums")
                    })
                }
                Text("Pick a song")
                List(songs) { song in
                    Text("\(song.title)")
                }
                .onAppear() {
                    SongApi().loadData { (songs) in
                        self.songs = songs
                    }
                }.navigationTitle("Music List")
            }
        }
    }
}

struct SongsView_Previews: PreviewProvider {
    static var previews: some View {
        SongsView()
    }
}
