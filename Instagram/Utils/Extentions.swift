//
//  Extentions.swift
//  Instagram
//
//  Created by katka.slivova on 30/01/2023.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

