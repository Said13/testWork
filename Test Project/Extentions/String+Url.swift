//
//  String+LocalUrl.swift
//  SpyTalk
//
//  Created by Vadim Zhydenko on 4/25/18.
//  Copyright © 2018 Vadim Zhydenko. All rights reserved.
//

import Foundation

extension String {
    
    var url: URL? {
        return URL(string: self)
    }
    
}
