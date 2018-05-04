//
//  Video.swift
//  YouTube
//
//  Created by Евгений Липадат on 27.04.2018.
//  Copyright © 2018 Евгений Липадат. All rights reserved.
//

import Foundation


class Video {
    var videoName: String?
    var thumbnailImage: String?
    var numberOfViews: NSNumber?
    var chanel: Chanel?
    var uploadDate: Date?
}

class Chanel {
    var profilelImage: String?
    var subTitle: String?
}



