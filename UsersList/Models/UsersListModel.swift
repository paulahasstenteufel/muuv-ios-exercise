//
//  UsersListModel.swift
//  ListingUsers
//
//  Created by Paula Hasstenteufel on 2022-06-21.
//

import SwiftUI

struct UsersListModel {
    struct UserRow {
        var avatar: URL?
        var name: String
        var id: Decimal
    }
    
    var currentPage: Decimal
    var totalPages: Decimal
    var users: [UserRow]
    
    init(_ dto: UsersList) {
        currentPage = dto.page
        totalPages = dto.totalPages
        users = dto.users
            .map { user in
                UserRow(
                    avatar: URL(string: user.data.avatar ?? ""),
                    name: (user.data.lastName + ", " + user.data.firstName),
                    id: user.data.id
                )
            }
    }
}
