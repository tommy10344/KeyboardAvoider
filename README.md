# KeyboardAvoider

`KeyboardAvoider` is the utility class for prevent covering TextField by software keyboard.

## Usage

- Initialize `KeyboardAvoider` class with scrollView.

```Swift
self.keyboardAvoider = KeyboardAvoider(scrollView: scrollView)
```

- Set `UITextFieldDelegate` to textField and call `textFieldDidBeginEditing()` in `UITextFieldDelegate`'s `textFieldDidBeginEditing()`

```Swift
func textFieldDidBeginEditing(_ textField: UITextField) {
    keyboardAvoider.textFieldDidBeginEditing(textField)
}
```

- Call `beginObservingKeyboardEvent()` in `viewWillAppear()`

```Swift
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    keyboardAvoider.beginObservingKeyboardEvent()
}
```

- Call `endObservingKeyboardEvent()` in `viewWillDisappear()`

```Swift
override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    keyboardAvoider.endObservingKeyboardEvent()
}
```