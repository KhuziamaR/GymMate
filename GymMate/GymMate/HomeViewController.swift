//
//  HomeViewController.swift
//  GymMate
//
//  Created by Kinza Rehman on 5/6/21.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var posts = [Post]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadPosts()
        
//        var post = Post(captionText: "test", photoUrlString: "url1")
//        print(post.caption)
//        print(post.photoUrl)
        
    }
    
    func loadPosts() {
        Database.database().reference().child("posts").observe(.childAdded) { (snapshot: DataSnapshot) in
            print(Thread.isMainThread)
            if let dict = snapshot.value as? [String: Any] {
                let captionText = dict["caption"] as! String
                let photoUrlString = dict["photoUrl"] as! String
                let usernameString = dict["username"] as! String
//                let profileImageUrlString = dict["profileImageUrl"] as! String
                
                let post = Post(captionText: captionText, photoUrlString: photoUrlString, usernameString: usernameString)
                self.posts.append(post)
                print(self.posts)
                self.tableView.reloadData()
            }
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
//        cell.textLabel?.text = posts[indexPath.row].caption
        cell.captionTextView.text = posts[indexPath.row].caption
        cell.usernameTextView.text = posts[indexPath.row].username
        
        let imageUrl = posts[indexPath.row].photoUrl
        let fileUrl = URL(string: imageUrl)
        let imageData = try! Data(contentsOf: fileUrl!)
     

        cell.postImage.image = UIImage(data: imageData)
        
//        image.layer.cornerRadius = 40
//        image.clipsToBounds = true
        
        return cell
    }
}

