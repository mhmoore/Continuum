//
//  PostDetailTableViewController.swift
//  Continuum
//
//  Created by Michael Moore on 8/27/19.
//  Copyright © 2019 Michael Moore. All rights reserved.
//

import UIKit

class PostDetailTableViewController: UITableViewController {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    
    var post: Post? {
        didSet {
            loadViewIfNeeded()
            updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func commentButtonTapped(_ sender: Any) {
        let alertController = UIAlertController.init(title: "Leave a comment", message: "tell 'em how you really feel", preferredStyle: .alert)
        alertController.addTextField { (textfield) in
        }
        
        let addCommentAction = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let comment = alertController.textFields?.first?.text, !comment.isEmpty,
                  let post = self.post else { return }
            PostController.shared.addCommentTo(post: post, text: comment, completion: { (_) in
            })
            self.tableView.reloadData()
        }
        
        let cancelCommentAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
            alertController.textFields?.first?.text = ""
            alertController.dismiss(animated: true, completion: nil)
        }
        
        alertController.addAction(addCommentAction)
        alertController.addAction(cancelCommentAction)
        present(alertController, animated: true)
    }
    
    @IBAction func shareButtonTapped(_ sender: Any) {
        guard let photo = post?.photo, let caption = post?.caption else { return }
        let activityController = UIActivityViewController(activityItems: [photo, caption], applicationActivities: nil)
        present(activityController, animated: true)
    }
    
    @IBAction func followPostButtonTapped(_ sender: Any) {
    }
    
    func updateViews() {
        guard let post = post else { return }
        photoImageView.image = post.photo
        captionLabel.text = post.caption
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let post = post else { return 0 }
        return post.comments.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath)
        guard let post = post else { return UITableViewCell() }
        let comment = post.comments[indexPath.row]

        cell.textLabel?.text = comment.text
        cell.detailTextLabel?.text = DateHelper.shared.mediumStringFor(date: post.timestamp)
        return cell
    }
}
