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
    let text: Text
    let user: Int
    let createdAt: CreatedAt
    let updatedAt: UpdatedAt

    enum CodingKeys: String, CodingKey {
        case id, text, user
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

enum CreatedAt: String, Codable {
    case the20211230T100148503Z = "2021-12-30T10:01:48.503Z"
}

enum Text: String, Codable {
    case 우와누가댓글1번이되실지궁금합니다 = "우와 누가 댓글 1번이 되실지 궁금합니다!!!"
}

enum UpdatedAt: String, Codable {
    case the20211230T100148518Z = "2021-12-30T10:01:48.518Z"
}

// MARK: - User


typealias Post = [PostElement]


