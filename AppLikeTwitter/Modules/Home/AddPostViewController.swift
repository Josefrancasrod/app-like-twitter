//
//  AddPostViewController.swift
//  AppLikeTwitter
//
//  Created by José Francisco Castillo Rodríguez on 04/11/21.
//

import UIKit
import Simple_Networking
import SVProgressHUD
import NotificationBannerSwift

class AddPostViewController: UIViewController {
    
    @IBOutlet weak var postTextView: UITextView!
    
    @IBAction func addPostAction(){
        savePost()
    }
    
    @IBAction func dismissAction(){
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func savePost(){
        let request = TweetRequest(text: postTextView.text, imageUrl: nil, videoUrl: nil, location: nil)
        
        SVProgressHUD.show()
        SN.post(endpoint: Endpoints.posts, model: request) { (response: SNResultWithEntity<Tweet, ErrorResponse>) in
            SVProgressHUD.dismiss()
            switch response {
            case .success:
                //Todo lo buen
                self.dismiss(animated: true, completion: nil)
            case .error(let error):
                NotificationBanner(title: "Error",subtitle: "\(error.localizedDescription)", style: .danger).show()
                return
                
                //Todo lo malo
            case .errorResult(let entity):
                NotificationBanner(title: "Error",subtitle: "\(entity.error.description)", style: .danger).show()
                return
                //error pero no tan malo
            }
        }
    }

}
