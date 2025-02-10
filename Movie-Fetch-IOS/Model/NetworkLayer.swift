import Foundation

class NetworkManager {
    static let shared = NetworkManager()

    private init() {}

    func fetchMovies(page: Int = 1) async throws -> [Movie] {
        let urlString = "\(Constant.baseURL)/movie/popular?api_key=\(Constant.apikey)&page=\(page)"
        guard let url = URL(string: urlString) else {
            throw NSError(domain: "Invalid URL", code: 0, userInfo: nil)
        }

        print("Fetching movies from URL: \(urlString)")

        let (data, _) = try await URLSession.shared.data(from: url)
        
        // Log the raw JSON data
        if let jsonString = String(data: data, encoding: .utf8) {
            print("Raw JSON: \(jsonString)")
        }

        let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
        return movieResponse.results
    }
    
    func searchMovies(query: String) async throws -> [Movie] {
        let urlString = "\(Constant.baseURL)/search/movie?api_key=\(Constant.apikey)&query=\(query)"
        guard let url = URL(string: urlString) else {
            throw NSError(domain: "Invalid URL", code: 0, userInfo: nil)
        }

        print("Fetching movies from URL: \(urlString)")

        let (data, _) = try await URLSession.shared.data(from: url)
        
        // Log the raw JSON data
        if let jsonString = String(data: data, encoding: .utf8) {
            print("Raw JSON: \(jsonString)")
        }

        let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
        return movieResponse.results
    }
}
