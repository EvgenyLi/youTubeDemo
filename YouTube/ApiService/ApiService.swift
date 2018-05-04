//
//  ApiService.swift
//  YouTube
//
//  Created by Евгений Липадат on 01.05.2018.
//  Copyright © 2018 Евгений Липадат. All rights reserved.
//

import UIKit

class ApiService: NSObject {
    
    static let sharedInstance = ApiService()
    
    func fetchVideo(complition: @escaping ([Video]) -> ()) {
        var videos = [Video]()
        let url = URL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard error == nil else {return}
            do {
                let data = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                for dictionary in data as! [[String: AnyObject]] {
                    let video = Video()
                    video.videoName = dictionary["title"] as? String
                    video.thumbnailImage = dictionary["thumbnail_image_name"] as? String
                    video.numberOfViews = dictionary["number_of_views"] as? NSNumber
                    
                    let channelDict = dictionary["channel"] as! [String: AnyObject]
                    let channel = Chanel()
                    channel.profilelImage = channelDict["profile_image_name"] as? String
                    channel.subTitle = channelDict["name"] as? String
                    video.chanel = channel
                    videos.append(video)
                }
                DispatchQueue.main.async {
                    complition(videos)
                }
            } catch {
                print(error.localizedDescription)
            }
            }.resume()
        
        
    }
    
    
}
