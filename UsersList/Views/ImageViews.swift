//
//  ImageViews.swift
//  UsersList
//
//  Created by Paula Hasstenteufel on 2022-06-15.
//

import SwiftUI

struct BackgroundRectangularView: View {
    var body: some View {
        Color.gray
            .opacity(0.5)
            .frame(maxHeight: 300)
    }
}

struct RoundImageView: View {
    let url: URL?
    
    var body: some View {
        AsyncImage(
            url: url,
            content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            },
            placeholder: {
                ProgressView()
            }
        )
        .frame(minWidth: 150, maxWidth: 180)
        .clipShape(Circle())
        .overlay {
            Circle().stroke(.white, lineWidth: 6)
        }
        .shadow(radius: 5)
    }
}

struct RowView: View {
    let row: UsersListModel.UserRow
    
    var body: some View {
        HStack {
            AsyncImage(url: row.avatar)
            
            Text(row.name)
            
            Spacer()
        }
    }
}
