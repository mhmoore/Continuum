//
//  PhotoSelectorViewController.swift
//  Continuum
//
//  Created by Michael Moore on 8/28/19.
//  Copyright © 2019 Michael Moore. All rights reserved.
//

import UIKit

protocol PhotoSelectorViewControllerDelegate: AnyObject {
    func photoSelectorViewControllerSelected(image: UIImage)
}

class PhotoSelectorViewController: UIViewController {
    
    @IBOutlet weak var selectImageView: UIImageView!
    @IBOutlet weak var selectImageButton: UIButton!
    
    weak var delegate: PhotoSelectorViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func selectImageButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Choose a photo", message: nil, preferredStyle: .actionSheet)
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let camera = UIAlertAction(title: "Camera", style: .default) { (_) in
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true)
        }
        let photoLibrary = UIAlertAction(title: "Photo Library", style: .default) { (_) in
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
            self.dismiss(animated: true)
        }
        
        alertController.addAction(camera)
        alertController.addAction(photoLibrary)
        alertController.addAction(cancel)
        self.present(alertController, animated: true)
    }

}

extension PhotoSelectorViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        delegate?.photoSelectorViewControllerSelected(image: chosenImage)
        selectImageView.image = chosenImage
        selectImageButton.setTitle("", for: .normal)
        dismiss(animated: true)
    }
}
