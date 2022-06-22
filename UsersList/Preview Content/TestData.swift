//
//  TestData.swift
//  UsersList
//
//  Created by Paula Hasstenteufel on 2022-06-16.
//

import Foundation

struct TestData {
    static var userDetails: UserDetails = {
        let url = Bundle.main.url(forResource: "UserDetails", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        
        var details = try! decoder.decode(UserDetails.self, from: data)
        return details
    }()
    
    static var usersList: UsersList = {
        let url = Bundle.main.url(forResource: "UsersList", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        
        var list = try! decoder.decode(UsersList.self, from: data)
        return list
    }()
}

extension UserDetailsModel {
    init(_ dto: UserDetails) {
        id = dto.data.id
        firstName = dto.data.firstName
        lastName = dto.data.lastName
        email = dto.data.email ?? ""
        supportUrl = URL(string: dto.support?.url ?? "")
        supportText = dto.support?.text
        avatar = URL(string: dto.data.avatar ?? "")
    }
}
