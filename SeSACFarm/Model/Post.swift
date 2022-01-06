// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let post = try? newJSONDecoder().decode(Post.self, from: jsonData)

import Foundation

// MARK: - PostElement
struct PostElement: Codable {
    let id: Int
    let comment: String
    let user: User
    let post: PostClass
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, comment, user, post
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - PostClass
struct PostClass: Codable {
    let id: Int
    let text: String
    let user: Int
    let createdAt: String
    let updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, text, user
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}



// MARK: - User


typealias Post = [PostElement]


