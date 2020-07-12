//
//  UserArticleCell.swift
//  Jet2Travel
//
//  Created by Rakesh Patole on 09/07/20.
//

import SwiftUI

struct UserArticleCell: View {
    var article : Article?
    var body: some View {
        VStack(alignment:.leading){
            UserCell(user: article?.users.first, additionalDetails: article?.createAgo())
            ArticleCell(article: article)
        }
    }
}
