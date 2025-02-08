import RealHTTP

enum AppRequests {
    struct GetLatesNews: Codable, APIResourceConvertible {
        typealias Result = NewsContainerModel
        var nextPage: String?
        
        func request() -> HTTPRequest {
            var parameters: [String: String] = [
                "apikey": Constants.apiKey,
                "country": "ru",
                "language": "en"
            ]
            
            if let nextPage {
                parameters["page"] = nextPage
            }

            return HTTPRequest {
                $0.path = "api/1/latest"
                $0.method = .get
                $0.maxRetries = 3
                $0.add(parameters: parameters)
            }
        }
    }
}
