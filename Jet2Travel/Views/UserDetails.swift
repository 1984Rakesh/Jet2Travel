//
//  UserDetails.swift
//  Jet2Travel
//
//  Created by Rakesh Patole on 08/07/20.
//

import SwiftUI

struct UserDetails: View {
    var user : User?
    
    var body: some View {
        VStack(){
            Spacer(minLength:20)
            AsynImage(url: user?.avatarURL())
                .frame(width: 200, height: 200)
                .cornerRadius(100)
            Text("\(user?.name ?? "Rakesh") \(user?.lastname ?? "Patole")")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            Text(user?.designation ?? "Developer")
                .font(.headline)
                .multilineTextAlignment(.center)
            Text(user?.city ?? "Pune")
                .font(.headline)
                .multilineTextAlignment(.center)
            Text(user?.about ?? "Nothing")
                .multilineTextAlignment(.center)
            Spacer()
        }
        .padding(.horizontal, 10.0)
    }
}

struct UserDetails_Previews: PreviewProvider {
    static var previews: some View {
        UserDetails()
    }
}
