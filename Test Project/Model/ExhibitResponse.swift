//
//  ExhibitResponse.swift
//  Test Project
//
//  Created by Abdullah on 18.06.2018.
//  Copyright © 2018 Abdullah. All rights reserved.
//

import Foundation

class ExhibitResponse: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case exhibits = "list"
    }
    
    var exhibits: [Exhibit]?
    
    required convenience public init(from decoder: Decoder) throws {
        self.init()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // required
        self.exhibits = try container.decode([Exhibit].self, forKey: .exhibits)
        
    }
    
}
