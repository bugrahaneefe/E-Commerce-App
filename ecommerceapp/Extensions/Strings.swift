//
//  Strings.swift
//  ecommerceapp
//
//  Created by Buğrahan Efe on 10.08.2023.
//

import Foundation

extension String {
    func locally() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
