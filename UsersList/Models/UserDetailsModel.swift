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
    var supportText: String?
}
