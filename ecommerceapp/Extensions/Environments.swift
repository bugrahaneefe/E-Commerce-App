//
//  Environments.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 10.08.2023.
//

import Foundation
import SwiftUI

struct FrameWidth: EnvironmentKey {
    static var defaultValue: CGFloat = UIScreen.main.bounds.width
}

extension EnvironmentValues {
    var frameWidthValue: CGFloat {
        get { self[FrameWidth.self] }
        set { self[FrameWidth.self] = newValue }
    }
}
