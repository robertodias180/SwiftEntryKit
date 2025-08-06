//
//  EKKeyboardManager.swift
//  SwiftEntryKit
//
//  Created by Roberto Dias on 6/8/25.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

final class EKKeyboardManager {
    static let shared = EKKeyboardManager()
    
    var isVisible: Bool = false
    var keyboardHeight: CGFloat = 0
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            self.keyboardHeight = keyboardRectangle.height
            self.isVisible = true
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        self.keyboardHeight = 0
        self.isVisible = false
    }
}
