//
//  KeyboardAvoider.swift
//  KeyboardAvoider
//
//  Created by Hiroaki Tomiyoshi on 2019/10/16.
//  Copyright © 2019 Hiroaki Tomiyoshi. All rights reserved.
//

import UIKit

public class KeyboardAvoider: NSObject {
    private var scrollView: UIScrollView
    private var editingTextField: UITextField?
    private var contentOffsetOriginal: CGPoint?

    public required init(scrollView: UIScrollView) {
        self.scrollView = scrollView
    }

    /// Begin observing  `keyboardWillShowNotification` event.
    /// Must call this method in `UIViewController.viewWillAppear()`.
    /// [keyboardWillShowNotification](https://developer.apple.com/documentation/uikit/uiresponder/1621576-keyboardwillshownotification)
    public func beginObservingKeyboardEvent() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    }

    /// End observing  `keyboardWillShowNotification` event.
    /// Must call this method in `UIViewController.viewWillDisappear()`.
    /// [keyboardWillShowNotification](https://developer.apple.com/documentation/uikit/uiresponder/1621576-keyboardwillshownotification)
    public func endObservingKeyboardEvent() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }

    /// Tells that editing began in the specified text field.
    /// Must call this method in `UITextFieldDelegate.textFieldDidBeginEditing()`
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        self.editingTextField = textField
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        guard let editingTextField = self.editingTextField else { return }

        let textFieldFrame = editingTextField.convert(editingTextField.bounds, to: nil)
        if textFieldFrame.intersects(keyboardFrame) {
            let newContentOffset = { () -> CGPoint in
                let scrollY = textFieldFrame.maxY - keyboardFrame.origin.y
                return CGPoint(x: self.scrollView.contentOffset.x, y: self.scrollView.contentOffset.y + scrollY)
            }()
            self.scrollView.setContentOffset(newContentOffset, animated: true)
        }
    }
}
