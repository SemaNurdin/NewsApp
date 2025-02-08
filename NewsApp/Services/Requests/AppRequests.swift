import RealHTTP

enum AppRequests {
    struct GetLatesNews: Codable, APIResourceConvertible {
        typealias Result = NewsContainerModel
        
        func request() -> HTTPRequest {
            HTTPRequest {
                $0.path = "api/1/latest"
                $0.method = .get
                $0.maxRetries = 3
                $0.add(parameters: [
                    "apikey": "pub_683946998bfd042d43ba87a7f0065b487489f",
                    "country": "ru",
                    "language": "en"
                ])
            }
        }
    }
}
