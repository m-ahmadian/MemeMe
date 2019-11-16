//
//  TextFieldDelegate.swift
//  MemeMe 1.0 - 2
//
//  Created by Mehrdad on 2019-06-23.
//  Copyright © 2019 Mehrdad. All rights reserved.
//

import Foundation
import UIKit


//class TextFieldDelegate: NSObject, UITextFieldDelegate {
//
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        textField.text = ""
//    }
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
//}


class TextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
