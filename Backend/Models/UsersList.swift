//
//  UsersList.swift
//  ListingUsers
//
//  Created by Paula Hasstenteufel on 2022-06-21.
//

import Foundation

struct UsersList {
    typealias Users = [UserDetails]
    
    var page: Decimal
    var usersPerPage: Decimal
    var totalUsers: Decimal
    var totalPages: Decimal
    var users: Users
}

struct Support {
    var url: String?
    var text: String?
}

extension UsersList: Decodable {
    enum CodingKeys: String, CodingKey {
        case page
        case usersPerPage = "per_page"
        case totalUsers = "total"
        case totalPages = "total_pages"
        case users = "data"
    }
    
    // Here we are assuming all values are necessary, therefore
    // empty values will be handled as Errors.
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        page = try container.decode(Decimal.self, forKey: .page)
        usersPerPage = try container.decode(Decimal.self, forKey: .usersPerPage)
        totalUsers = try container.decode(Decimal.self, forKey: .totalUsers)
        totalPages = try container.decode(Decimal.self, forKey: .totalPages)
        
        users = try container.decode(Users.self, forKey: .users)
    }
}

extension Support: Decodable {
    enum CodingKeys: String, CodingKey {
        case url
        case text
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        url = try? container.decode(String.self, forKey: .url)
        text = try? container.decode(String.self, forKey: .text)
    }
}





