//
//  TextFieldDelegate1.swift
//  MemeMe 1.0 - 2
//
//  Created by Mehrdad on 9/9/18.
//  Copyright © 2018 Mehrdad. All rights reserved.
//

import Foundation
import UIKit

class TextFieldDelegate1: NSObject, UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
