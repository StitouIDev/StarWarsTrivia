//
//  FadeEnableBtn.swift
//  StarTrivia
//
//  Created by Hamza on 1/1/22.
//  Copyright © 2022 Hamza. All rights reserved.
//

import UIKit


class FadeEnableBtn : UIButton {
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 1.0
                }
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 0.5
                }
            }
        }
    }
}
