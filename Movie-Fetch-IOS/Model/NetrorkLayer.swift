import Foundation

class NetworkManager{
    static let shared = NetworkManager()
    
    private init(){}
    
    func fetchMovies(page: Int = 1) async throws-> [Movie]{
        let url = URL(string: "\(Constant.baseURL)/movie/popular?api_key=\(Constant.apikey)&page=\(page)")!
        let(data,_) = try await URLSession.shared.data(from: url)
        let movieResponse = try JSONDecoder().decode(MovieResponce.self, from: data)
        return movieResponse.result
    }
}
