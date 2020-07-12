//
//  Users.swift
//  Jet2Travel
//
//  Created by Rakesh Patole on 08/07/20.
//

import SwiftUI

struct Users: View {
    var usersProvider : DataProvider<User> = DataProvider<User>(finalPathComponent:"users?page=1&limit=10")
    
    @FetchRequest(
        entity: User.entity(),
        sortDescriptors: []
    ) var users : FetchedResults<User>
            
    var body: some View {
        List(users) { user in
            UserCell(user: user, additionalDetails: user.city)
                .onAppear {
                    if usersProvider.last == user {

                    }
                }
        }
        .onAppear {
//            usersProvider.fetchData { _ in }
        }
        .navigationTitle("Users")
    }
}

