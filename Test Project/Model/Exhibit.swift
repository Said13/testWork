//
//  Exhibit.swift
//  Test Project
//
//  Created by Abdullah on 18.06.2018.
//  Copyright © 2018 Abdullah. All rights reserved.
//

import UIKit

public class Exhibit: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case title, images
    }
    
    public var title: String?
    public var images: [String]?
    
    required convenience public init(from decoder: Decoder) throws {
        self.init()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // required
        self.title = try container.decode(String.self, forKey: .title)
        self.images = try container.decode([String].self, forKey: .images)

    }
    
}
