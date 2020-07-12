//
//  AsynImage.swift
//  Jet2Travel
//
//  Created by Rakesh Patole on 08/07/20.
//

import SwiftUI
import Combine
import Foundation

class ImageLoader : ObservableObject {
    @Published var image: UIImage?
    private var cancellable : AnyCancellable?
    private let url : URL?
    
    deinit {
        cancellable?.cancel()
    }
    
    init(url:URL?) {
        self.url = url
    }
    
    func load() {
        if let url = self.url {
            cancellable = URLSession.shared.dataTaskPublisher(for: url)
                .map { UIImage(data: $0.data ) }
                .replaceError(with: nil)
                .receive(on: DispatchQueue.main)
                .assign(to: \.image , on: self)
        }
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}

struct AsynImage: View {
    @ObservedObject private var imageLoader : ImageLoader
    
    init( url:URL? ){
        imageLoader = ImageLoader(url: url)
    }
    
    var body: some View {
        image
            .onAppear { self.imageLoader.load() }
            .onDisappear { self.imageLoader.cancel() }
    }
    
    var image: some View {
        Group {
            if imageLoader.image != nil {
                Image(uiImage: imageLoader.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            else {
                Image(systemName: "eye.slash")
            }
        }
    }
}
