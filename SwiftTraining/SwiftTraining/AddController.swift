//
//  AddController.swift
//  SwiftTraining
//
//  Created by Charlene Lauron on 9/23/15.
//  Copyright © 2015 Seer Technologies, Inc. All rights reserved.
//

import Foundation
import UIKit

class AddController : BaseController, AddViewProtocol {
    
    var addView: AddView?
    var studentInfo: Dictionary<String, String>?
    var st: Student?
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadXibName("AddView")
        self.addView = (self.view as! AddView)
        self.addView?.delegate = self
    }
    
    func saveButtonPressed() {
        self.studentInfo = ["name":self.addView!.textFieldName.text!, "bday":self.addView!.textFieldBirthday.text!, "degree":self.addView!.textFieldDegree.text!]
        print("\(self.studentInfo)")
        
        Connector.addStudent(processNewStudent, details: self.studentInfo!)
        
        self.navigationController?.popViewControllerAnimated(false)
    }
    
    func processNewStudent(newStudent: JSON){
        self.st = Student(name: newStudent["name"].string!, bday: newStudent["bday"].string!, degree: newStudent["degree"].string!)
    }
}
