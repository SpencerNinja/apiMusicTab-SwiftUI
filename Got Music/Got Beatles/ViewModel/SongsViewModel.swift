//
//  MainViewModel.swift
//  Got Music
//
//  Created by Spencer Hurd on 5/25/22.
//

import Foundation

class SongsViewModel : ObservableObject{
    @Published var songs = [Song]()
    @Published var songId = 0
    
    func loadData(completion:@escaping ([Song]) -> ()) {
        guard let url = URL(string: "https://www.songsterr.com/a/ra/songs.json?pattern=Beatles") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let songs = try! JSONDecoder().decode([Song].self, from: data!)
            print(songs)
            DispatchQueue.main.async {
                completion(songs)
            }
        }.resume()
        
    }
}


// TODO: async await

