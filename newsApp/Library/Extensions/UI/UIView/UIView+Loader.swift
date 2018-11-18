//
//  UIView+Loader.swift
//  newsApp
//
//  Created by Pawan Kumar on 19/11/18.
//  Copyright © 2018 Pawan Kumar. All rights reserved.
//

import Foundation
import MBProgressHUD

// MARK: - UIView Extension

extension UIView {

    // MARK: - Loading Progress View

    func showLoader(_ subtitle: String = "") {
        let hud = MBProgressHUD.showAdded(to: self, animated: true)
        hud.isSquare = false
        hud.mode = .indeterminate
        hud.bezelView.color = UIColor(red: 236 / 255, green: 240 / 255, blue: 240 / 255, alpha: 1.0)
    }

    func hideLoader() {
        MBProgressHUD.hide(for: self, animated: true)
    }
}
