//
//  AddPostTableViewController.swift
//  Continuum
//
//  Created by Michael Moore on 8/27/19.
//  Copyright © 2019 Michael Moore. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController, UIImagePickerControllerDelegate {
    @IBOutlet weak var selectImageButton: UIButton!
    @IBOutlet weak var captionTextField: UITextField!
    @IBOutlet weak var selectImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        selectImageButton.setTitle("Select Image", for: .normal)
        selectImageView.image = nil
        captionTextField.text = ""
    }
   
    @IBAction func selectImageButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Choose a photo", message: nil, preferredStyle: .actionSheet)
        let imagePicker = UIImagePickerController()

        
        let camera = UIAlertAction(title: "Camera", style: .default) { (_) in
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true)
        }
        let photoLibrary = UIAlertAction(title: "Photo Library", style: .default) { (_) in
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true)
        }
        
        alertController.addAction(camera)
        alertController.addAction(photoLibrary)
        self.present(alertController, animated: true)
        
        selectImageButton.setTitle("", for: .normal)
    }
    
    @IBAction func addPostButtonTapped(_ sender: Any) {
        guard let caption = captionTextField.text,
            let photo = selectImageView.image else { return }
        PostController.shared.createPostWith(photo: photo, caption: caption) { (post) in
        }
        self.tabBarController?.selectedIndex = 0
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.tabBarController?.selectedIndex = 0
    }
}


