import Foundation

struct LoginResponse: Codable {
    let accessToken: String
    let refreshToken: String
    let accessTokenExpirationDuration: Int
}
