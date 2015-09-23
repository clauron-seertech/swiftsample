//
//  AddView.swift
//  SwiftTraining
//
//  Created by Charlene Lauron on 9/23/15.
//  Copyright © 2015 Seer Technologies, Inc. All rights reserved.
//

import Foundation
import UIKit

protocol AddViewProtocol {
    func saveButtonPressed()
}

class AddView : BaseView {
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldBirthday: UITextField!
    @IBOutlet weak var textFieldDegree: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var delegate: AddViewProtocol?
    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        if self.delegate != nil && self.delegate?.saveButtonPressed != nil{
            self.delegate?.saveButtonPressed()
        }
    }
}