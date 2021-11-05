//
//  AddPostViewController.swift
//  AppLikeTwitter
//
//  Created by José Francisco Castillo Rodríguez on 04/11/21.
//

import UIKit

class AddPostViewController: UIViewController {
    
    @IBOutlet weak var postTextView: UITextView!
    
    @IBAction func addPostAction(){
        
    }
    
    @IBAction func dismissAction(){
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
