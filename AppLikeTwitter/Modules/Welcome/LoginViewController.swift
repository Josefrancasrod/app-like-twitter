//
//  LoginViewController.swift
//  AppLikeTwitter
//
//  Created by José Francisco Castillo Rodríguez on 20/10/21.
//

import UIKit
import NotificationBannerSwift
import Simple_Networking
import SVProgressHUD

class LoginViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: - IBActions
    
    @IBAction func loginButtonAction(){
        view.endEditing(true)
        performLogin()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }
    
    private func setupUI(){
        loginButton.layer.cornerRadius = 25
    }
    
    //MARK: - Private Methods
    
    private func performLogin(){
        guard let email = emailTextField.text, !email.isEmpty else {
            NotificationBanner(title: "Error", subtitle: "Debes especificar un email", style: .warning).show()
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            NotificationBanner(title: "Error", subtitle: "Debes especificar una contraseña", style: .warning).show()
            return
        }
        
        if !password.isEmpty && !email.isEmpty  {
            //NotificationBanner(title: "Success", subtitle: "Entrada de datos valida", style: .success).show()
        }
        
        //Crear request
        let request = LoginRequest(email: email, password: password)
        
        //Iniciamos la carga
        SVProgressHUD.show()
        
        //Llamar a libreria
        SN.post(endpoint: Endpoints.login, model: request) { (response: SNResultWithEntity<LoginResponse, ErrorResponse>) in
            SVProgressHUD.dismiss()
            
            switch response {
            case .success(let response):
                //Todo lo bueno
                NotificationBanner(subtitle: "Bienvendio \(response.user.names)", style: .success).show()
                self.performSegue(withIdentifier: "showHome", sender: nil)
                SimpleNetworking.setAuthenticationHeader(prefix: "", token: response.token)
                
            case .error(let error):
                NotificationBanner(title: "Error",subtitle: "\(error.localizedDescription)", style: .danger).show()
                return
                
                //Todo lo malo
            case .errorResult(let entity):
                NotificationBanner(title: "Error",subtitle: "\(entity.error.description)", style: .danger).show()
                return
                //error pero no tan malo
            }
        }
        
        
        //
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
