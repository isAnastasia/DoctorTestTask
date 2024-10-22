//
//  Extension+Font.swift
//  DoctorTestTask
//
//  Created by Anastasia Gorbunova on 22.10.2024.
//

import UIKit
import SwiftUICore



struct Constants {
    static private var font = UIFont(name: "SFProDisplay-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14)
    static let lineSpacing: CGFloat = 24 - font.lineHeight
}

extension Font {
    static var bodyFont: Font {Font.custom("SFProDisplay-Regular", size: 16)}
    static var boldBodyFont: Font {Font.custom("SFProDisplay-Bold", size: 16)}
    static var smallBodyFont: Font { Font.custom( "SFProDisplay-Regular", size: 14)}
    
}

