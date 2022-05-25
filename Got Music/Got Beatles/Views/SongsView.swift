//
//  BooksView.swift
//  Got Music
//
//  Created by Spencer Hurd on 5/25/22.
//

import SwiftUI

struct SongsView: View {
    
    @EnvironmentObject var songsVM: SongsViewModel
    @State private var songs = [Song]()
    
    var body: some View {
        ZStack {
            // background
            
            // content
            NavigationView {
                VStack {
                    Text("Got Beatles")
                    Text("Pick an instrument")
                    selectInstrument
                    Text("Pick a song")
                    listOfSongs
                }
            }
        }
    }
}

extension SongsView {
    
    var selectInstrument: some View {
        HStack {
            Button(action: {
                songsVM.selectedInstrument = "tabs"
                print("selectedInstrument = \(songsVM.selectedInstrument)")
            }, label: {
                Text("Guitar Tabs")
            })
            Button(action: {
                songsVM.selectedInstrument = "chords"
                print("selectedInstrument = \(songsVM.selectedInstrument)")
            }, label: {
                Text("Guitar Chords")
            })
            Button(action: {
                songsVM.selectedInstrument = "bass"
                print("selectedInstrument = \(songsVM.selectedInstrument)")
            }, label: {
                Text("Bass")
            })
        }
    }
    
    var listOfSongs: some View {
        List(songs) { song in
            NavigationLink(
                destination: SongView().onAppear {
                    songsVM.songId = song.id
                }) {
                Text("\(song.title)")
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        .onAppear() {
            SongsViewModel().loadData { (songs) in
                self.songs = songs
            }
        }
    }
    
}

struct SongsView_Previews: PreviewProvider {
    static var previews: some View {
        SongsView()
    }
}
