//
//  Video.swift
//  SwiftUI-List
//
//  Created by Tommy on 1/27/23.
//

import SwiftUI

struct Video: Identifiable{
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
    let viewCount: Int
    let uploadDate: String
    let url: URL
}

struct VideoList {
    
    static let topTen = [
        Video(imageName: "dequine",
              title: "Dequine - Матча чай | OYU Live",
              description: "OYU - būl jandy dauyspen oryndalatyn jäne är türli janrga jatatyn ärtister änderiniñ jinagy.Besinši bölim episodtary är beysenbi saiyn shygatyn bolady. OYU - это музыкальный проект, собравший в себя live исполнения артистов самых разных жанров. Эпизоды пятого сезона будут выходить каждый четверг.",
              viewCount: 147870,
              uploadDate: "Nov 17, 2022",
              url: URL(string: "https://www.youtube.com/watch?v=3ruZjkrtNfg")!),
        
        Video(imageName: "dos-muqasan",
              title: "Дос-Мұқасан плейлисті",
              description: "birew деген медиа кеңістіктің барлық саласын қамтитын шығармышық бірлестік. Арнаға жазылып, лайк басуды ұмытпа. Жобаны қолдау, ұсыныс, жарнама бойынша: +7 747 351 6971 Дәурен О. Instagram: @thebirew",
              viewCount: 204112,
              uploadDate: "Oct 18, 2022",
              url: URL(string: "https://www.youtube.com/watch?v=fyJxdo1KQ1U")!),
        
        Video(imageName: "yenlik",
              title: "Yenlik | Men dep oıla | Yeski taspa",
              description: "Қазақтың сүйікті әндеріне жаңа көзқарас. Artist - Yenlik ",
              viewCount: 162897,
              uploadDate: "May 19, 2017",
              url: URL(string: "https://www.youtube.com/watch?v=gG5kg8RUc54")!),
              
        Video(imageName: "frank",
              title: "Frank Ocean - Godspeed",
              description: "All copyrights belong to the original owners, not me. I don't own any rights. This is just a fan made video I made for fun.",
              viewCount: 119115,
              uploadDate: "May 21, 2017",
              url: URL(string: "https://www.youtube.com/watch?v=07XwUtF2lPQ")!),
        
        Video(imageName: "ariana",
              title: "Ariana Grande - positions (official video)",
              description: "",
              viewCount: 112213,
              uploadDate: "July 7, 2017",
              url: URL(string: "https://www.youtube.com/watch?v=tcYodQoapMg")!),
        
        Video(imageName: "abuse",
              title: "NINETY ONE - ABUSE | Official Visualizer",
              description: "",
              viewCount: 106021,
              uploadDate: "October 4, 2019",
              url: URL(string: "https://www.youtube.com/watch?v=UsdhuIKmmDY")!),
        
        Video(imageName: "lovely",
              title: "Billie Eilish, Khalid - lovely",
              description: "Directed by Matty Peacock and Taylor Cohen DP: Sing Howe Yam Production Company: Happy Place VFX: Ingenuity Studios",
              viewCount: 92292,
              uploadDate: "January 28, 2020",
              url: URL(string: "https://www.youtube.com/watch?v=V1Pl8CzNzCw")!),
    ]
}

