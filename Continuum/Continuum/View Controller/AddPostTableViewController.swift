//
//  AddPostTableViewController.swift
//  Continuum
//
//  Created by Michael Moore on 8/27/19.
//  Copyright © 2019 Michael Moore. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController, PhotoSelectorViewControllerDelegate {
   
    @IBOutlet weak var captionTextField: UITextField!
    
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
//    override func viewDidDisappear(_ animated: Bool) {
//        selectImageButton.setTitle("Select Image", for: .normal)
//        selectImageView.image = nil
//        captionTextField.text = ""
//    }
   
//    @IBAction func selectImageButtonTapped(_ sender: Any) {
//        let alertController = UIAlertController(title: "Choose a photo", message: nil, preferredStyle: .actionSheet)
//        let imagePicker = UIImagePickerController()
//        imagePicker.delegate = self
//
//
//        let camera = UIAlertAction(title: "Camera", style: .default) { (_) in
//            imagePicker.sourceType = .camera
//            self.present(imagePicker, animated: true)
//        }
//        let photoLibrary = UIAlertAction(title: "Photo Library", style: .default) { (_) in
//            imagePicker.sourceType = .photoLibrary
//            self.present(imagePicker, animated: true)
//        }
//        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
//            self.dismiss(animated: true)
//        }
//
//        alertController.addAction(camera)
//        alertController.addAction(photoLibrary)
//        alertController.addAction(cancel)
//        self.present(alertController, animated: true)
//    }
    
    @IBAction func addPostButtonTapped(_ sender: Any) {
        guard let caption = captionTextField.text,
            let photo = selectedImage else { return }
        PostController.shared.createPostWith(photo: photo, caption: caption) { (post) in
        }
        self.tabBarController?.selectedIndex = 0
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.tabBarController?.selectedIndex = 0
    }
    
    func photoSelectorViewControllerSelected(image: UIImage) {
        selectedImage = image
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toPhotoSelectorVC" {
            let destinationVC = segue.destination as? PhotoSelectorViewController
            destinationVC?.delegate = self
        }
    }
}

//extension AddPostTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        guard let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
//        selectImageView.image = chosenImage
//        selectImageButton.setTitle("", for: .normal)
//        dismiss(animated: true)
//    }
//}

