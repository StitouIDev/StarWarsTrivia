//
//  BlackBgView.swift
//  StarTrivia
//
//  Created by Hamza on 12/24/21.
//  Copyright © 2021 Hamza. All rights reserved.
//

import UIKit


class BlackBgView: UIView {
    
    override func awakeFromNib() {
        layer.backgroundColor = BLACK_BG
        layer.cornerRadius = 10
    }
}

class BlackBgButton: UIButton {
    
    override func awakeFromNib() {
        layer.backgroundColor = BLACK_BG
        layer.cornerRadius = 10
    }}
