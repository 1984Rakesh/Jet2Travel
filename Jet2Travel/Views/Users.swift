//
//  Users.swift
//  Jet2Travel
//
//  Created by Rakesh Patole on 08/07/20.
//

import SwiftUI

struct Users: View {
    @ObservedObject
    var usersProvider = DataProvider<User>(endPoint:"users")
                
    var body: some View {
        List(usersProvider) { user in
            UserCell(user: user, additionalDetails: user.city)
                .onAppear {
                    if usersProvider.last == user {
                        usersProvider.fetchNext { _ in }
                    }
                }
        }
        .navigationTitle("Users")
    }
}

