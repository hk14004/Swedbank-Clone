import Foundation

struct StartSessionResponse: Codable {
    let accessToken: String
    let refreshToken: String
    let accessTokenExpirationDuration: Int
    let userID: String
}
