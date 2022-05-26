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
    
    init() {
       UITableView.appearance().separatorStyle = .none
       UITableViewCell.appearance().backgroundColor = .clear
       UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    Text("Got Beatles")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .italic()
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.yellow.opacity(0.8).cornerRadius(10))
                    listOfSongs
                }
                .background(
                    Image("pexels-922690-lukas-rychvalsky")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                )
            }
        }
    }
}

extension SongsView {
    
    var listOfSongs: some View {
        VStack(spacing: 0) {
            Text("Pick a song to get song's guitar tab")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .frame(width: UIScreen.main.bounds.width - 40)
                .padding(.vertical)
                .background(Color.white.opacity(0.8).cornerRadius(10))
//                .offset(y: 15)
            List(songs) { song in
                NavigationLink(
                    destination: SongView().onAppear {
                        songsVM.songId = song.id
                    }) {
                        Text("\(song.title)")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .listRowBackground(
                        LinearGradient(gradient:
                                        Gradient(
                                            colors: [
                                                Color.orange.opacity(0.8),
                                                Color.yellow.opacity(0.8),
                                                Color.orange.opacity(0.8),
                                                Color.orange.opacity(0.8)
                                            ]
                                        ),
                                       startPoint: .topTrailing,
                                       endPoint: .bottomLeading
                                      )
                    )
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
    
}

struct SongsView_Previews: PreviewProvider {
    static var previews: some View {
        SongsView()
            .environmentObject(SongsViewModel())
    }
}
