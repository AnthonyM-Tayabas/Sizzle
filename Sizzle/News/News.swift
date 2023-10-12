//
//  News.swift
//  Sizzle
//
//  Created by Averey on 10/10/23.
//

import Foundation

class News: NSObject, Identifiable {
    internal init(articaleName: String = "", content: String, imageUrl: String, publisher: String, datePublished: String) {
        self.articaleName = articaleName
        self.content = content
        self.imageUrl = imageUrl
        self.publisher = publisher
        self.datePublished = datePublished
    }

    let id = UUID()
    var articaleName: String = ""
    var content: String
    var imageUrl: String
    var publisher: String
    var datePublished: String
    
    
    static func newsList() -> [News] {
        let newsList: [News] = [
            News(articaleName: "Lorem Ipsum Dolor Set Amet, consectetur adipiscing elit sed do", content: "Lorem Ipsume Dolor Set Amet. Lorem Ipsume Dolor Set Amet, consecutor adipsicing elit, sed do eusmod tempor incididunt ut labore magna aliqua. Ut enim ad", imageUrl: "https://hips.hearstapps.com/hmg-prod/images/gettyimages-1229892983-square.jpg", publisher: "John Doe", datePublished: "10 Minutes Ago"),
            News(articaleName: "Article 2", content: "Lorem Ipsume Dolor Set Amet, consecutor adipsicing elit, sed do eusmod tempor incididunt ut labore magna aliqua. Ut enim ad", imageUrl: "https://media.istockphoto.com/id/155439315/photo/passenger-airplane-flying-above-clouds-during-sunset.jpg?s=612x612&w=0&k=20&c=LJWadbs3B-jSGJBVy9s0f8gZMHi2NvWFXa3VJ2lFcL0=", publisher: "John Doe", datePublished: "9 Hours Ago"),
            News(articaleName: "Article 3", content: "Lorem Ipsume Dolor Set Amet", imageUrl: "https://www.daysoftheyear.com/wp-content/uploads/national-fast-food-day.jpg", publisher: "John Doe", datePublished: "10 Hours Ago"),
            News(articaleName: "Article 4", content: "Lorem Ipsume Dolor Set Amet, consecutor adipsicing elit, sed do eusmod tempor incididunt ut labore magna aliqua. Ut enim ad", imageUrl: "https://newsinfo.inquirer.net/files/2022/10/pagasa-queenie-1210am-11012022.png", publisher: "John Doe", datePublished: "September 10, 2023"),
            News(articaleName: "Article 5", content: "Lorem Ipsume Dolor Set Amet, consecutor adipsicing elit, sed do eusmod tempor incididunt ut labore magna aliqua. Ut enim ad", imageUrl: "https://www.shiksha.com/online-courses/articles/wp-content/uploads/sites/11/2020/08/Trending-Technologies-scaled.jpg", publisher: "John Doe", datePublished: "August 29, 2023"),
            News(articaleName: "Article 6", content: "Lorem Ipsume Dolor Set Amet, consecutor adipsicing elit, sed do eusmod tempor incididunt ut labore magna aliqua. Ut enim ad", imageUrl: "https://media.post.rvohealth.io/wp-content/uploads/2020/08/coffee-worlds-biggest-source-of-antioxidants-1296x728-feature_0-800x728.jpg", publisher: "John Doe", datePublished: "August 28, 2023"),
            News(articaleName: "Article 7", content: "Lorem Ipsume Dolor Set Amet, consecutor adipsicing elit, sed do eusmod tempor incididunt ut labore magna aliqua. Ut enim ad", imageUrl: "https://media.post.rvohealth.io/wp-content/uploads/2020/08/coffee-worlds-biggest-source-of-antioxidants-1296x728-feature_0-800x728.jpg", publisher: "John Doe", datePublished: "August 13, 2023"),
            
        ]
        
        return newsList
        
    }
}

