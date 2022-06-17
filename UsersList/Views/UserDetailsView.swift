//
//  UserDetailsView.swift
//  UsersList
//
//  Created by Paula Hasstenteufel on 2022-06-15.
//

import SwiftUI

struct UserDetailsView: View {
    
    let userDetails: UserDetailsModel
    var body: some View {
        VStack {
            BackgroundRectangularView()
                .ignoresSafeArea(edges: .top)
            
            RoundImageView(url: userDetails.avatar)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                
                Text(userDetails.firstName + " " + userDetails.lastName)
                    .font(.title)
                
                Text(userDetails.email)
                
                Spacer()
                
                Text(userDetails.supportText) //TODO: Add link from url
                    .font(.caption)
            }
            .padding()
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let userDetails = UserDetailsModel(TestData.userDetails)
        UserDetailsView(userDetails: userDetails)
    }
}
