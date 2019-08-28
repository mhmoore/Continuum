//
//  AddPostTableViewController.swift
//  Continuum
//
//  Created by Michael Moore on 8/27/19.
//  Copyright © 2019 Michael Moore. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController {
    @IBOutlet weak var selectImageButton: UIButton!
    @IBOutlet weak var captionTextField: UITextField!
    @IBOutlet weak var selectImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        selectImageButton.titleLabel?.text = "Select Image"
        selectImageView.image = nil
        captionTextField.text = ""
    }
   
    @IBAction func selectImageButtonTapped(_ sender: Any) {
        selectImageButton.titleLabel?.text = ""
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
