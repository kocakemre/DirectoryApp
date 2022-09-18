//
//  VC_PersonDetail.swift
//  DirectoryApp
//
//  Created by Emre Kocak on 13.09.2022.
//

import UIKit

class VC_PersonDetail: UIViewController {

    // MARK: - UI Elements
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldSurname: UITextField!
    @IBOutlet weak var textFieldNumber: UITextField!
    @IBOutlet weak var switchGender: UISwitch!
    
    var person: Person!
    var isUpdate = false
   
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if person == nil {
            person = Person()
        }else {
            textFieldName.text = person.name
            textFieldSurname.text = person.surname
            textFieldNumber.text = person.number
            switchGender.isOn = person.gender == Gender.Man
            
            isUpdate = true
            
            textFieldName.isEnabled = false
            textFieldSurname.isEnabled = false
            switchGender.isEnabled = false
        }
        
        
    }
    
    // MARK: - Functions
    
    func imperativeChecks() -> String {
        
        var message = ""
        
        if textFieldName.text == "" {
            
            message += "Ad boş olamaz."
            
        }
        
        if textFieldSurname.text == "" {
            
            message += "\nSoyad boş olamaz."
            
        }
        
        if textFieldNumber.text == "" {
            
            message += "\nTelefon boş olamaz."
            
        }
        
        return message
    }
    
    // MARK: - UI Elements
    
    @IBAction func buttonSave_TUI(_ sender: Any) {
        
        let message = imperativeChecks()
        
        if message == "" {
            person.name = textFieldName.text 
            person.surname = textFieldSurname.text
            person.number = textFieldNumber.text
            person.gender = switchGender.isOn ? Gender.Man : Gender.Woman
            
            if !isUpdate {
                Globals.persons.append(person)
            }
            
            navigationController?.popViewController(animated: true)
            
        } else {
            
            let alertController = UIAlertController(title: "Hata", message: message, preferredStyle: .alert)
            
            alertController.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
            
            present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func buttonClose_TUI(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
