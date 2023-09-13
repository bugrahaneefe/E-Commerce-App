//
//  Environments.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 10.08.2023.
//

import SwiftUI

struct ScreenFrameKey: EnvironmentKey {
    static var defaultValue: CGRect { UIScreen.main.bounds }
}

extension EnvironmentValues {
    var screenFrame: CGRect {
        self[ScreenFrameKey.self]
    }
}
