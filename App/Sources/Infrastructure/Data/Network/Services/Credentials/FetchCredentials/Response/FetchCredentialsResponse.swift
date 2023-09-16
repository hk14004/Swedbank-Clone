import Foundation

struct FetchCredentialsResponse: Codable {
    let accessToken: String
    let refreshToken: String
    let accessTokenExpirationDuration: Int
}
