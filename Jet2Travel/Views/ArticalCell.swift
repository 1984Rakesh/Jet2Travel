//
//  ArticalCell.swift
//  Jet2Travel
//
//  Created by Rakesh Patole on 08/07/20.
//

import SwiftUI

struct ArticleCell: View {
    var body: some View {
        VStack(alignment:.leading){
            UserCell()
            Image("128")
                .resizable()
                .aspectRatio(contentMode: .fill)
            Text("Artical Content")
            Text("Artical Title")
            Text("Artical URL")
                .font(.caption)
            HStack {
                Text("Likes")
                    .font(.caption)
                    .fontWeight(.bold)
                Spacer()
                Text("Comments")
                    .font(.caption)
                    .fontWeight(.bold)
            }
        }
    }
}

struct ArticalCell_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCell()
    }
}
