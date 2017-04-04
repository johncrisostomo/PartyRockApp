//
//  PartyRock.swift
//  PartyRockApp
//
//  Created by John Crisostomo on 04/04/2017.
//  Copyright © 2017 John Crisostomo. All rights reserved.
//

import Foundation

class PartyRock {
    private var _imageURL: String!
    private var _videoURL: String!
    private var _videoTitle: String!
    
    var imageURL: String {
        return _imageURL
    }
    
    var videoURL: String {
        return _videoURL
    }
    
    var videoTitle: String {
        return _videoTitle
    }
    
    init(imageUrl: String, videoUrl: String, videoTitle: String) {
        _imageURL = imageUrl
        _videoURL = videoUrl
        _videoTitle = videoTitle
    }
}
