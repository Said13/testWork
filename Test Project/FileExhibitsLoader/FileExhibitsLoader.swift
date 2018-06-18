//
//  FileExhibitsLoader.swift
//  Test Project
//
//  Created by Abdullah on 18.06.2018.
//  Copyright © 2018 Abdullah. All rights reserved.
//

import UIKit
import Alamofire

class FileExhibitsLoader: IExhibitsLoader {
    
    private let url = "https://gist.githubusercontent.com/u-android/41ade05b6ae1133e7e86e9dfd55f1794/raw/bab1c383b0384d1a4c889b399ad7b13ae05634fa/ios%20challenge%20json"
    
    @discardableResult
    func getExhibitList(_ handler: @escaping ([Exhibit]) -> Void) -> DataRequest {
        return Alamofire.request(url).responseJSONDecodable { (response: DataResponse<ExhibitResponse>) in
            guard let values = response.result.value?.exhibits  else { return handler([]) }
            handler(values)
        }
    }
    
}
