import Foundation

struct MovieResponse: Codable {
    let results: [Movie]
}

struct Movie: Identifiable, Codable {
    let id: Int
    let title: String
    let overview: String
    let releaseDate: String?
    let posterPath: String?

    var posterUrl: URL? {
        guard let posterPath = posterPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500" + posterPath)
    }

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case releaseDate = "release_date"
        case posterPath = "poster_path"
    }
    
}


struct TabBar: Identifiable {
    var id = UUID()
    var iconname: String
    var tab: TabIcon
    var index: Int
}

let tabitem = [
    TabBar(iconname: "house", tab: .home, index: 0),
    TabBar(iconname: "magnifyingglass", tab: .card, index: 1),
    TabBar(iconname: "star", tab: .favorite, index: 2),
    TabBar(iconname: "square.stack", tab: .purchase, index: 3),
    TabBar(iconname: "person", tab: .notification, index: 4),
]

enum TabIcon: String {
    case home
    case card
    case favorite
    case purchase
    case notification
}

struct Card: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let genre: String
}





