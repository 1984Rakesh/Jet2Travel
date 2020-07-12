//
//  UserCell.swift
//  Jet2Travel
//
//  Created by Rakesh Patole on 08/07/20.
//

import SwiftUI

struct UserCell: View {
    let user : User?
    let additionalDetails : String?
    
    @State var isPresented : Bool = false
    
    var body: some View {
        HStack( alignment:.top) {
            AsynImage(url: user?.avatarURL() )
                .frame(width: 50.0, height: 50.0)
                .cornerRadius(25.0)
            VStack( alignment:.leading) {
                HStack {
                    Text(user?.name ?? "")
                        .font(.headline)
                    Spacer()
                    Text(additionalDetails ?? "")
                        .font(.caption)
                }
                Text(user?.designation ?? "")
                    .font(.subheadline)
            }            
        }
        .onTapGesture {
            isPresented.toggle()
        }
        .sheet(isPresented: $isPresented,
                content: {
                    UserDetails(user: user!)
                })
    }
}
