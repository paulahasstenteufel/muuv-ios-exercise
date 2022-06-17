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
        
        var userDetails = try! decoder.decode(UserDetails.self, from: data)
        return userDetails
    }()
}
