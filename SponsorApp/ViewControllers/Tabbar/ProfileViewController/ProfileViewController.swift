//
//  ProfileViewController.swift
//  SponsorApp
//
//  Created by Can Duru on 20.09.2022.
//

import UIKit
import SideMenu
import FirebaseAuth
import FirebaseFirestore

class ProfileViewController: UIViewController {

    var userChoice = "" {
        didSet{
            if userChoice == "0" {
                setOrganizationView()
            }
            
            if userChoice == "1" {
                setCompanyView()
            }
        }
    }
    
    weak var handle: AuthStateDidChangeListenerHandle?
    
    var menu: SideMenuNavigationController?
    lazy var menuBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "sidebar.leading")?.withRenderingMode(.alwaysOriginal).withTintColor(.systemBlue), style: .done, target: self, action: #selector(menuBarButtonItemTapped))
    @objc
    func menuBarButtonItemTapped(){
        present(menu!, animated: true)
    }
    lazy var menuView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        handle = Auth.auth().addStateDidChangeListener { [weak self] (auth, user) in
            guard let self = self else {return}
            if ((user) != nil) {
                
            } else {
                let vc = AuthViewController()
                vc.modalPresentationStyle = .currentContext
                self.navigationController?.present(vc, animated: true)
            }
        }
        
        //MARK: Side Menu Load
        navigationItem.title = "BeMySponsor"
        navigationItem.setLeftBarButton(menuBarButtonItem, animated: false)
        menu = SideMenuNavigationController(rootViewController: MenuListController())
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: false)
    }
    
    func setOrganizationView(){
        
    }
    
    
    func setCompanyView(){
        
    }
    
    
    
    
    
    
    func getUserData(){
        userid(name: "String") { (useruid) in
            Auth.auth().addStateDidChangeListener { (auth, user) in
                if (user != nil) {
                    let db = Firestore.firestore()
                    db.collection("users").document(useruid)
                        .addSnapshotListener { documentSnapshot, error in
                          guard let document = documentSnapshot else {
                            print("Error fetching document: \(error!)")
                            return
                          }
                          guard let data = document.data()?["usertype"] else {
                            print("Document data was empty.")
                            return
                          }
                            self.userChoice = ((data) as! String)
                        }
                }
            }
        }
    }
    
    func userid(name: String, completion: @escaping (String) -> Void){
        let db = Firestore.firestore()
        let user = Auth.auth().currentUser
        let uid = user!.uid
        db.collection("users").whereField("uid", isEqualTo: uid)
            .getDocuments() { (querySnapshot, err) in
                if err != nil {
                    let alert = UIAlertController(title: String(localized: "dataError"), message: "", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: String(localized: "okButton"), style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                } else {
                    for document in (querySnapshot!.documents) {
                        let useruid = document.documentID
                        completion(useruid)
                    }
                }
            }
    }
}
