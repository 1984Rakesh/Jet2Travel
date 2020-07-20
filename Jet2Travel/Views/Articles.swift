//
//  Articles.swift
//  Jet2Travel
//
//  Created by Rakesh Patole on 08/07/20.
//

import SwiftUI

struct Articles: View {
    @ObservedObject var articleProvider = DataProvider<Article>(endPoint: "blogs")
    
    var body: some View {
        List(articleProvider) { article in
            UserArticleCell(article: article)
                .onAppear {
                    if articleProvider.last == article {
                        articleProvider.fetchNext{ _ in }
                    }
                }            
        }
    }
}
