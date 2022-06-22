//
//  UsersListModel.swift
//  ListingUsers
//
//  Created by Paula Hasstenteufel on 2022-06-21.
//

import SwiftUI

struct UsersListModel {
    typealias Users = [UserDetails]
    
    var currentPage: Decimal
    var totalPages: Decimal
    var users: Users
    
    init(_ dto: UsersList) {
        currentPage = dto.page
        totalPages = dto.totalPages
        users = dto.users
    }
}
