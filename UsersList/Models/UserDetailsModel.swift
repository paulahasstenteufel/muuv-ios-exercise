//
//  UserDetailsModel.swift
//  UsersList
//
//  Created by Paula Hasstenteufel on 2022-06-15.
//

import SwiftUI

struct UserDetailsModel {
    var id: Decimal
    var firstName: String
    var lastName: String
    var email: String
    var avatar: URL?
    var supportUrl: URL?
    var supportText: String
    
    init(_ dto: UserDetails) {
        id = dto.data.id ?? 0
        firstName = dto.data.firstName ?? ""
        lastName = dto.data.lastName ?? ""
        email = dto.data.email ?? ""
        supportUrl = URL(string: dto.support.url ?? "")
        supportText = dto.support.text ?? ""
        avatar = URL(string: dto.data.avatar ?? "")
    }
}
