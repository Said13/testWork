//
//  IExhibitsLoader.swift
//  Test Project
//
//  Created by Abdullah on 18.06.2018.
//  Copyright © 2018 Abdullah. All rights reserved.
//

import Foundation
import Alamofire

public protocol IExhibitsLoader {
    func getExhibitList(_ handler: @escaping ([Exhibit]) -> Void) -> DataRequest
}
