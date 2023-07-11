//
//  SignUpViewController.swift
//  SponsorApp
//
//  Created by Can Duru on 14.11.2022.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    var nameField = UITextField()
    var emailField = UITextField()
    var passwordField = UITextField()
    var passwordAuthenticateField = UITextField()
    var userOrganizationStyle = UIButton()
    var userCompanyStyle = UIButton()
    var signUpButton = UIButton()
    var userChoice = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLabels()
        
        self.hideKeyboardWhenTappedAround()
    }
    
    
    func setLabels(){
        
        let imageLogo = UIImage(named: "Logo")
        let imageView = UIImageView(image: imageLogo)
        imageView.clipsToBounds = true
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false

        nameField.placeholder = "Please enter your organization name."
        nameField.borderStyle = .roundedRect
        nameField.layer.borderColor = CGColor(red: 13/255, green: 95/255, blue: 255/255, alpha: 1)
        nameField.layer.borderWidth = CGFloat(1)
        nameField.autocorrectionType = .no
        view.addSubview(nameField)
        nameField.translatesAutoresizingMaskIntoConstraints = false
        
        emailField.placeholder = "Please enter email."
        emailField.borderStyle = .roundedRect
        emailField.layer.borderColor = CGColor(red: 13/255, green: 95/255, blue: 255/255, alpha: 1)
        emailField.layer.borderWidth = CGFloat(1)
        emailField.autocorrectionType = .no
        emailField.autocapitalizationType = .none
        view.addSubview(emailField)
        emailField.translatesAutoresizingMaskIntoConstraints = false

        passwordField.placeholder = "Please enter password."
        passwordField.borderStyle = .roundedRect
        passwordField.layer.borderColor = CGColor(red: 13/255, green: 95/255, blue: 255/255, alpha: 1)
        passwordField.layer.borderWidth = CGFloat(1)
        view.addSubview(passwordField)
        passwordField.isSecureTextEntry = true
        passwordField.autocorrectionType = .no
        passwordField.autocapitalizationType = .none
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        
        passwordAuthenticateField.placeholder = "Please enter password again."
        passwordAuthenticateField.borderStyle = .roundedRect
        passwordAuthenticateField.layer.borderColor = CGColor(red: 13/255, green: 95/255, blue: 255/255, alpha: 1)
        passwordAuthenticateField.layer.borderWidth = CGFloat(1)
        view.addSubview(passwordAuthenticateField)
        passwordAuthenticateField.isSecureTextEntry = true
        passwordAuthenticateField.autocorrectionType = .no
        passwordAuthenticateField.autocapitalizationType = .none
        passwordAuthenticateField.translatesAutoresizingMaskIntoConstraints = false
        
        userOrganizationStyle.backgroundColor = .systemBlue
        userOrganizationStyle.layer.borderWidth = 1.0
        userOrganizationStyle.setTitle("Organization", for: .normal)
        userOrganizationStyle.layer.borderColor = CGColor(red: 13/255, green: 95/255, blue: 255/255, alpha: 1)
        userOrganizationStyle.layer.cornerRadius = 15
        userOrganizationStyle.clipsToBounds = true
        view.addSubview(userOrganizationStyle)
        userOrganizationStyle.addTarget(self, action: #selector(organizationFunction), for: .touchUpInside)
        userOrganizationStyle.translatesAutoresizingMaskIntoConstraints = false
        
        userCompanyStyle.backgroundColor = UIColor(cgColor: CGColor(red: 13/255, green: 95/255, blue: 255/255, alpha: 0.3))
        userCompanyStyle.setTitle("Company", for: .normal)
        userCompanyStyle.layer.borderWidth = 1.0
        userCompanyStyle.layer.borderColor = CGColor(red: 13/255, green: 95/255, blue: 255/255, alpha: 1)
        userCompanyStyle.layer.cornerRadius = 15
        userCompanyStyle.clipsToBounds = true
        view.addSubview(userCompanyStyle)
        userCompanyStyle.addTarget(self, action: #selector(companyFunction), for: .touchUpInside)
        userCompanyStyle.translatesAutoresizingMaskIntoConstraints = false

        signUpButton.backgroundColor = .systemBlue
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.tintColor = .white
        signUpButton.layer.cornerRadius = 15
        signUpButton.clipsToBounds = true
        view.addSubview(signUpButton)
        signUpButton.addTarget(self, action: #selector(signUpUser), for: .touchUpInside)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        //MARK: Constraints
        NSLayoutConstraint.activate([
            
            imageView.centerXAnchor.constraint(equalTo: nameField.centerXAnchor),
            imageView.bottomAnchor.constraint(equalTo: nameField.topAnchor, constant: -10),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            nameField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            nameField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            nameField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            nameField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            nameField.heightAnchor.constraint(equalToConstant: 35),

            emailField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            emailField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 5),
            emailField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            emailField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            emailField.heightAnchor.constraint(equalToConstant: 35),
            
            passwordField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 5),
            passwordField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            passwordField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            passwordField.heightAnchor.constraint(equalToConstant: 35),
            
            passwordAuthenticateField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            passwordAuthenticateField.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 5),
            passwordAuthenticateField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            passwordAuthenticateField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            passwordAuthenticateField.heightAnchor.constraint(equalToConstant: 35),
            
            userOrganizationStyle.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -10),
            userOrganizationStyle.topAnchor.constraint(equalTo: passwordAuthenticateField.bottomAnchor, constant: 5),
            userOrganizationStyle.heightAnchor.constraint(equalToConstant: 35),
            userOrganizationStyle.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.centerXAnchor, constant: 10),
            userOrganizationStyle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            userCompanyStyle.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 10),
            userCompanyStyle.topAnchor.constraint(equalTo: passwordAuthenticateField.bottomAnchor, constant: 5),
            userCompanyStyle.heightAnchor.constraint(equalToConstant: 35),
            userCompanyStyle.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            userCompanyStyle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -10),

            signUpButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: userOrganizationStyle.bottomAnchor, constant: 10),
            signUpButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            signUpButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            signUpButton.heightAnchor.constraint(equalToConstant: 35),
        ])
    }
    
    @objc func organizationFunction(){
        nameField.placeholder = "Please enter your organization name."
        userCompanyStyle.backgroundColor = UIColor(cgColor: CGColor(red: 13/255, green: 95/255, blue: 255/255, alpha: 0.3))
        userOrganizationStyle.backgroundColor = .systemBlue
        userChoice = 0
    }
    
    @objc func companyFunction(){
        nameField.placeholder = "Please enter your company name."
        userCompanyStyle.backgroundColor = .systemBlue
        userOrganizationStyle.backgroundColor = UIColor(cgColor: CGColor(red: 13/255, green: 95/255, blue: 255/255, alpha: 0.3))
        userChoice = 1
    }
    
    @objc func signUpUser(){
        
        
        let error = validateFields()
        
        if error != nil {

        } else {
            //MARK: All Fields Filled
            let name = nameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //MARK: Create User
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                if  err != nil{
                    let alert = UIAlertController(title: "Error occcured while saving data.", message: "", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                else {
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["name":name, "explanation":"", "usertype":self.userChoice, "events": "", "partners": "", "Instagram":"", "LinkedIn":"", "YouTube":"", "budget":"", "contact":"", "category":"", "uid": result!.user.uid]) { (error) in
                        if error != nil {
                            let alert = UIAlertController(title: "Error occcured while saving data.", message: "", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: String(localized: "Ok"), style: UIAlertAction.Style.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        }
                    }
                    UserDefaults.standard.set(Auth.auth().currentUser!.uid, forKey: "user_uid_key")
                    UserDefaults.standard.synchronize()
                    Auth.auth().currentUser?.sendEmailVerification { error in
                    }
                    self.dismiss(animated: true)
                }
            }
        }
    }
    
    
    
    func validateFields() -> String? {
        
        if nameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        passwordAuthenticateField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            let alert = UIAlertController(title: "Please fill all fields.", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return "Lütfen bütün boşlukları doldurun."
        }
        
        let cleanedPassword = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let authenticatecleanedPassword = passwordAuthenticateField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if cleanedPassword != authenticatecleanedPassword{
            let alert = UIAlertController(title: "Passwords do not match.", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return "Doğrulama şifreniz ile girdiğiniz şifre uyuşmuyor. "
        }
        
        if isPasswordValid(cleanedPassword) == false {
            let alert = UIAlertController(title: "Password do not match the requirements.", message: "Please make sure your password is at least 8 characters, contains a special character (!,?,&,...) and a number.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return "Lütfen şifrenizin en az 8 karakter olduğundan, özel bir karakter (!,?,&,...) ve bir sayı içerdiğinden emin olun."
        }
        return nil
    }
    
    func isPasswordValid(_ password : String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[0-9])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
}
