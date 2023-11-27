//
//  RegisterViewController.swift
//  MenHa
//
//  Created by 이성현 on 2023/11/24.
//

import UIKit

import Foundation
import FirebaseAuth
import FirebaseFirestore
import MobileCoreServices
import UniformTypeIdentifiers
import FirebaseStorage

class RegisterViewController : UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet var Username: UITextField!
    @IBOutlet var Useremail: UITextField!
    @IBOutlet var Userpassword: UITextField!
    @IBOutlet var UserpasswordDC: UITextField!
    @IBOutlet var imageView: UIImageView!
    var flag: Int = 0
    var imageflag: Int = 0
    var newMedia: Bool?
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.borderWidth = 1
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        // Do any additional setup after loading the view.
    }
    @IBAction func createNewUser(_ sender: Any) {
        let email : String = Useremail.text ?? ""
        let password : String = Userpassword.text ?? ""
        let name : String = Username.text ?? ""
        let passwordDC : String = UserpasswordDC.text ?? ""
        let db = Firestore.firestore()
        if self.anyException(email, password, name, passwordDC) {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("failed becasue of \(error)")
                return
            } else {
                guard let imageData = self.imageView.image?.jpegData(compressionQuality: 0.4) else {return}
                let imageName = "\(email)'s profile"
                let firebaseRef = Storage.storage().reference().child("\(imageName)")
                firebaseRef.putData(imageData, metadata: nil) { metaData, error in
                    if let error = error {
                        print("failed to upload profile image")
                        return
                    }
                }
                guard let user = authResult?.user else { return }
                db.collection("users").document(user.uid).setData( [
                        "name": name,
                        "email": email,
                        "password": password,
                        "whoareyou": self.flag
                    ])
                print("user added")
            }
        }
        let test = UIStoryboard.init(name: "Main", bundle: nil)
        guard let vc = test.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else{return}
        self.navigationController?.pushViewController(vc, animated: true)

    }
    @IBAction func IAmMentor(_ sender: Any) {
        flag = 1
    }
    @IBAction func IAmMentee(_ sender: Any) {
        flag = 2
    }
    
    
    @IBAction func useCameraRoll(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.savedPhotosAlbum) {
            
            let imagePicker = UIImagePickerController()

            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            imagePicker.mediaTypes = [UTType.image.identifier]
            imagePicker.allowsEditing = false

            self.present(imagePicker, animated: true, completion: nil)
            
            self.newMedia = false
        }
    }
    
    @IBAction func getImage(_ sender: Any) {
        let StorageRef = Storage.storage().reference()
        let imageRef = StorageRef.child("image@image.com's profile")
        
        imageRef.getData(maxSize: 1*1024*1024) { data, error in
            if let error = error {
                print("Downloading image failed : \(error)")
                return
            } else {
                self.imageView.image = UIImage(data: data!)
            }
        }
    }
    
    func anyException(_ email : String , _ password : String , _ name : String, _ passwordDC : String) -> Bool {
        if email == "" || password == "" || name == "" || passwordDC == "" {
            print("You either don't have name, password, email or passwordDC")
            return true
        }
        if password != passwordDC {
            print("Match your password")
            return true
        }
        if flag != 1 && flag != 2 {
            print("Choose your role")
            return true
        }
        if imageflag != 1 {
            print("Choose your profile picture")
            return true
        }
        return false
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // UIImagePickerController.InfoKey.mediaType
        let mediaType = info[.mediaType] as! NSString
        
        self.dismiss(animated: true, completion: nil)
        
        if mediaType.isEqual(to: UTType.image.identifier) {
            let image = info[.originalImage] as! UIImage
            
            imageView.image = image
            imageView.contentMode = .scaleAspectFill
            imageflag = 1
            
            if (newMedia == true) {
                UIImageWriteToSavedPhotosAlbum(image, self, nil, nil)
                
                // 오류가 발생하면 경고 상자를 통해 사용자에게 보고하고 싶은 경우
                // UIImageWriteToSavedPhotosAlbum(image, self, #selector(ViewController.image(image:didFinishSavingWithError:contextInfo:)), nil)
            }
            
        }
    }
}
