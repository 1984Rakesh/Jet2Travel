//
//  Articles.swift
//  Jet2Travel
//
//  Created by Rakesh Patole on 08/07/20.
//

import SwiftUI

struct Articles: View {
    @ObservedObject var articleProvider : DataProvider<Article> = DataProvider<Article>(finalPathComponent:"blogs")
    
    var body: some View {
        List(articleProvider) { article in
            UserArticleCell(article: article)
                .onAppear {
                    if articleProvider.last == article {
                        articleProvider.fetchNext{ _ in }
                    }
                }
        }
        .onAppear {
            articleProvider.fetchData { _ in }
        }
    }
}
