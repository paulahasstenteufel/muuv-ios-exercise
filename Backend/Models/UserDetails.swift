//
//  UserDetails.swift
//  UsersList
//
//  Created by Paula Hasstenteufel on 2022-06-15.
//

import Foundation

struct UserDetails {
    var data: Data
    var support: Support
    
    struct Data: Decodable {
        var id: Decimal
        var firstName: String
        var lastName: String
        var email: String
        var avatarUrl: URL
    }
    
    struct Support: Decodable {
        var url: URL
        var text: String
    }
}

extension UserDetails: Decodable {
    enum CodingKeys: String, CodingKey {
        case data
        case support
        
        enum DataKeys: String, CodingKey {
            case id
            case email
            case avatarUrl = "avatar"
            case firstName = "first_name"
            case lastName = "last_name"
        }
        
        enum SupportKeys: String, CodingKey {
            case url
            case text
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(Self.Data.self, forKey: .data)
        support = try container.decode(Self.Support.self, forKey: .support)
        
        let dataContainer = try container.nestedContainer(keyedBy: CodingKeys.DataKeys.self, forKey: .data)
        data.id = try dataContainer.decode(Decimal.self, forKey: .id)
        data.email = try dataContainer.decode(String.self, forKey: .email)
        data.avatarUrl = try dataContainer.decode(URL.self, forKey: .avatarUrl)
        data.firstName = try dataContainer.decode(String.self, forKey: .firstName)
        data.lastName = try dataContainer.decode(String.self, forKey: .lastName)
        
        let supportContainer = try container.nestedContainer(keyedBy: CodingKeys.SupportKeys.self, forKey: .support)
        support.url = try supportContainer.decode(URL.self, forKey: .url)
        support.text = try supportContainer.decode(String.self, forKey: .text)
    }
}
