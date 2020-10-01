//
//  ProgressExtension.swift
//  GitHubApiApp
//
//  Created by 滝浪翔太 on 2020/10/01.
//

import UIKit
import PKHUD

extension UIViewController {
    func showProgress() {
        HUD.show(.progress)
    }
    
    func hideProgress() {
        HUD.hide()
    }
}
