//
//  HomeViewController.swift
//  AppLikeTwitter
//
//  Created by José Francisco Castillo Rodríguez on 02/11/21.
//

import UIKit
import Simple_Networking
import SVProgressHUD
import NotificationBannerSwift

class HomeViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    
    private let cellId = "TweetTableViewCell"
    private var dataSource = [Tweet]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        getPosts()
    }
    
    private func setupUI(){
        //1.- Asiganr DataSource
        //2.- Registrar celdas
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    private func getPosts(){
        //1.- Indicar la carga al usuario
        SVProgressHUD.show()
        //2.- Consumir el servicio
        SN.get(endpoint: Endpoints.posts) { (result: SNResultWithEntity<[Tweet], ErrorResponse>) in
            SVProgressHUD.dismiss()
            
            switch result {
            case .success(let posts):
                //Todo lo bueno
                self.dataSource = posts
                self.tableView.reloadData()
                
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

//MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource{
    
    //Numbero total d eceldas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    //configurar celda deseada
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        if let cell = cell as? TweetTableViewCell {
            cell.setupCellWith(post: dataSource[indexPath.row])
        }
        
        return cell
    }
}
