import Foundation


struct MovieResponce : Codable{
    let result: [Movie]
}

struct Movie : Codable, Identifiable{
    let id: Int
    let tittle: String
    let overview: String
    let posterPath: String?
    let releaseDate: String
    let voteAverage: Double
    
    var posterUrl : URL? {
        guard let posterPath = posterPath else {return nil}
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
    }
}
