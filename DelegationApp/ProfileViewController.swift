//
//  ProfileViewController.swift
//  DelegationApp
//
//  Created by Maxim Makarov on 13.01.2024.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var surnameTextField: UITextField!
    
    weak var delegate: ProfileViewControllerDelegate?
    
    private var user = User(name: "", surname: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        surnameTextField.delegate = self
    }
    
    @IBAction func saveAction() {
        view.endEditing(true) // Для принудительного завершения работы с текстовым полем при нажатии на кнопку Save
        delegate?.setGreeting(for: user)
        dismiss(animated: true)
    }
    
    @IBAction func cancelAction() {
        dismiss(animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension ProfileViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == nameTextField {
            user.name = nameTextField.text ?? ""
        } else {
            user.surname = surnameTextField.text ?? ""
        }
        print(user)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
