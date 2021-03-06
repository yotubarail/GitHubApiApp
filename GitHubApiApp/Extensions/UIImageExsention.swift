//
//  UIImageExtension.swift
//  GitHubApiApp
//
//  Created by 滝浪翔太 on 2020/09/27.
//

import Foundation
import UIKit

extension UIImage {
    
    convenience init(url: String) {
        
        let url = URL(string: url)
        do {
            let data = try Data(contentsOf: url!)
            self.init(data: data)!
            return
        } catch {
            print(error.localizedDescription)
        }
        self.init()
    }
}

