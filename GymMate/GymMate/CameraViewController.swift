//
//  CameraViewController.swift
//  GymMate
//
//  Created by RIAZ on 5/13/21.
//

import UIKit
import ProgressHUD
import FirebaseStorage
import FirebaseAuth
import FirebaseDatabase



class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    var ref: DatabaseReference!

    @IBOutlet weak var photo: UIImageView!

    @IBOutlet weak var captionTextView: UITextField!
    
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var zipcode: UITextField!
    var selectedImage: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        photo.isUserInteractionEnabled = true
        self.ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handlePost()
    }
    
    func handlePost() {
        if selectedImage != nil {
           self.shareButton.isEnabled = true
            self.shareButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        } else {
           self.shareButton.isEnabled = true
            self.shareButton.backgroundColor = .lightGray

        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @objc func handleSelectPhoto() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        present(pickerController, animated: true, completion: nil)
        
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        view.endEditing(true)
        
        ProgressHUD.show("Waiting...", interaction: false)
        
        guard (Auth.auth().currentUser?.uid) != nil else { return }
        if let profileImg = self.selectedImage, let imageData = profileImg.jpegData(compressionQuality: 0.1) {
            let metaData = StorageMetadata()
            metaData.contentType = "image/jpg"
            let photoIdString = NSUUID().uuidString
            print(photoIdString)
            let storageRef = Storage.storage().reference(forURL: Config.STORAGE_ROOF_REF).child("posts").child(photoIdString)
            storageRef.putData(imageData, metadata: nil, completion: { (metadata, error) in
                if error != nil {
                    ProgressHUD.showError(error!.localizedDescription)
                    return
                }
                storageRef.downloadURL { url, error in
//                    print(url!.absoluteString)
                    self.sendDataToDatabase(photoUrl: url!.absoluteString)
                }
            })
        } else {
            ProgressHUD.showError("Profile Image can't be empty")
        }
    }
    @IBAction func onCameraButton(_ sender: Any) {
          let picker = UIImagePickerController()
          picker.delegate = self
          picker.allowsEditing = true
          
          if UIImagePickerController.isSourceTypeAvailable(.camera){
              picker.sourceType = .camera
          } else {
              picker.sourceType = .photoLibrary
          }
          present(picker, animated: true, completion: nil)
      }
    
    @IBAction func shareButton_TouchUpInside(_ sender: Any) {
        print("share button pressed")
    }
    @IBAction func remove_TouchUpInside(_ sender: Any) {
        clean()
        handlePost()
    }
    
    func sendDataToDatabase(photoUrl: String) {
        let postsReference = self.ref.child("posts")
        let newPostId = postsReference.childByAutoId().key!
        let user = Auth.auth().currentUser
        let newPostReference = postsReference.child(newPostId)
        var profileImageUrlString = ""
        
        let profileImageUrlRef = Ref().storageSpecificProfile(uid: user?.uid ?? "none")
        profileImageUrlRef.downloadURL { URL, Error in
            profileImageUrlString = URL?.absoluteString ?? "none"
        }
        newPostReference.setValue(["photoUrl": photoUrl, "caption": captionTextView.text!,"zipcode": zipcode.text!,"username": user?.displayName ?? "Anonymous", "uid": user?.uid, "profileImageUrl": profileImageUrlString], withCompletionBlock: {
            (error, ref) in
            if error != nil {
                ProgressHUD.showError(error!.localizedDescription)
                return
            }
            ProgressHUD.showSuccess("Success")
           self.clean()
            self.tabBarController?.selectedIndex = 0
        })
    }
    
    func clean() {
        self.captionTextView.text = ""
        self.photo.image = UIImage(named: "camera")
        self.selectedImage = nil
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           let image = info[.editedImage] as! UIImage
           selectedImage = image
           photo.image = image
           
           dismiss(animated: true, completion: nil)
       }
}

