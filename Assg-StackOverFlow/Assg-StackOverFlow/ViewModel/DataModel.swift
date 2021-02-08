//
//  DataModel.swift
//  Assg-StackOverFlow
//
//  Created by Dinesh Danda on 2/8/21.
//  Copyright © 2021 Dinesh Danda. All rights reserved.
//

import Foundation

struct DataModel: Codable {
    var items: [Item]
    let hasMore: Bool
    let quotaMax, quotaRemaining: Int

    enum CodingKeys: String, CodingKey {
        case items
        case hasMore = "has_more"
        case quotaMax = "quota_max"
        case quotaRemaining = "quota_remaining"
    }
}
// MARK: - Item
struct Item: Codable {
    let owner: Owner
    let isAccepted: Bool
    let score, lastActivityDate, creationDate, answerID: Int
    let questionID: Int
    let contentLicense: ContentLicense
    let lastEditDate: Int?

    enum CodingKeys: String, CodingKey {
        case owner
        case isAccepted = "is_accepted"
        case score
        case lastActivityDate = "last_activity_date"
        case creationDate = "creation_date"
        case answerID = "answer_id"
        case questionID = "question_id"
        case contentLicense = "content_license"
        case lastEditDate = "last_edit_date"
    }
}

enum ContentLicense: String, Codable {
    case ccBySa40 = "CC BY-SA 4.0"
}

// MARK: - Owner
struct Owner: Codable {
    let reputation, userID: Int
    let userType: UserType
    let acceptRate: Int?
    let profileImage: String
    let displayName: String
    let link: String

    enum CodingKeys: String, CodingKey {
        case reputation
        case userID = "user_id"
        case userType = "user_type"
        case acceptRate = "accept_rate"
        case profileImage = "profile_image"
        case displayName = "display_name"
        case link
    }
}

enum UserType: String, Codable {
    case registered = "registered"
    case unregistered = "unregistered"
}
