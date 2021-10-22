//
//  RegisterViewController.swift
//  AppLikeTwitter
//
//  Created by José Francisco Castillo Rodríguez on 20/10/21.
//

import UIKit
import NotificationBannerSwift

class RegisterViewController: UIViewController {
    

    
    
    //MARK: - Outlets
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: - IBActions
    
    @IBAction func registerButtonAction(){
        view.endEditing(true)
        performRegister()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupUI()
    }
    
    private func setupUI(){
        registerButton.layer.cornerRadius = 25
    }
    
    private func performRegister(){
        guard let name = nameTextField.text, !name.isEmpty else {
            NotificationBanner(title: "Error", subtitle: "Debes especificar un nombre", style: .warning).show()
            return
        }
        
        guard let email = emailTextField.text, !email.isEmpty else {
            NotificationBanner(title: "Error", subtitle: "Debes especificar un email", style: .warning).show()
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            NotificationBanner(title: "Error", subtitle: "Debes especificar una contraseña", style: .warning).show()
            return
        }
        
        if !password.isEmpty && !email.isEmpty && !name.isEmpty  {
            NotificationBanner(title: "Success", subtitle: "Entrada de datos valida", style: .success).show()
        }
        
        performSegue(withIdentifier: "showHome", sender: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
