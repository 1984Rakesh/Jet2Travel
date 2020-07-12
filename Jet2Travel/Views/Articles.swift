//
//  Articles.swift
//  Jet2Travel
//
//  Created by Rakesh Patole on 08/07/20.
//

import SwiftUI

struct Articles: View {
    var articleProvider : DataProvider<Article> = DataProvider<Article>(finalPathComponent:"blogs")
    
    @FetchRequest(
        entity: Article.entity(),
        sortDescriptors: []
    ) var articles : FetchedResults<Article>
    
    var body: some View {
        List(articles) { article in
            UserArticleCell(article: article)
                .onAppear {
                    if articles.last == article {
                        articleProvider.fetchNext{ _ in }
                    }
                }
        }
        .onAppear {
            articleProvider.fetchData { _ in }
        }
    }
}
