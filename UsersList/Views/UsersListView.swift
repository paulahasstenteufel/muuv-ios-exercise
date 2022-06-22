//
//  UsersListView.swift
//  ListingUsers
//
//  Created by Paula Hasstenteufel on 2022-06-21.
//

import SwiftUI

struct UsersListView: View {
    let list: UsersListModel
    
    var body: some View {
        List(list.users, id: \.id) { user in
            RowView(row: .init(
                avatar: user.avatar,
                name: user.name,
                id: user.id)
            )
        }
    }
}
