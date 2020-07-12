//
//  ArticalCell.swift
//  Jet2Travel
//
//  Created by Rakesh Patole on 08/07/20.
//

import SwiftUI

struct ArticleCell: View {
    var article : Article?
    
    var body: some View {
        VStack(alignment:.leading) {
            AsynImage(url: article?.imageURL() )
            Text(article?.content ?? "")
            Spacer(minLength:8.0)
            Text(article?.medias.first?.title ?? "")
            Spacer(minLength:8.0)
            Text(article?.medias.first?.url ?? "")
                .font(.caption)
            Spacer(minLength:16.0)
            HStack {
                Text("\(article?.likes ?? 0) like(s)")
                    .font(.caption)
                    .fontWeight(.bold)
                Spacer()
                Text("\(article?.comments ?? 0) Comment(s)")
                    .font(.caption)
                    .fontWeight(.bold)
            }
        }  
    }
}
