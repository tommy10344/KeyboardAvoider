//
//  ViewController.swift
//  Example
//
//  Created by Hiroaki Tomiyoshi on 2019/10/16.
//  Copyright © 2019 Hiroaki Tomiyoshi. All rights reserved.
//

import UIKit
import KeyboardAvoider

class ViewController: UIViewController {
    
    var keyboardAvoider: KeyboardAvoider!

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var textField5: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.keyboardAvoider = KeyboardAvoider(scrollView: scrollView)
        textField1.delegate = self
        textField2.delegate = self
        textField3.delegate = self
        textField4.delegate = self
        textField5.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        keyboardAvoider.beginObservingKeyboardEvent()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        keyboardAvoider.endObservingKeyboardEvent()
    }

}


extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        keyboardAvoider.textFieldDidBeginEditing(textField)
    }
}
