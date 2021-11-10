//
//  Photo.swift
//  SwiftUIPhotoGrid
//
//  Created by Tomas Havlicek on 03.11.2021.
//

import Foundation

struct Photo: Identifiable {
    var id = UUID()
    var name: String
}

let samplePhotos = (1...20).map {
    Photo(name: "coffee-\($0)")
}
