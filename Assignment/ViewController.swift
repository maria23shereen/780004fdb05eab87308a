//
//  ViewController.swift
//  Assignment
//
//  Created by Greenapex on 06/02/23.
//

import UIKit
import Alamofire
class ViewController: UIViewController {
    
    
    @IBOutlet weak var listTableView: UITableView!
    var hitsArray : NSArray?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getList()
    }

    
    
    func getList()
    {
            let request = AF.request("https://hn.algolia.com/api/v1/search_by_date?tags=story&page=1")
            request.responseJSON { response in
                
                switch response.result {

                case .success(let json):
                    print(json)
                    DispatchQueue.main.async {
                       let dict = json as? NSDictionary
                        print(dict?.value(forKey: "hits") as? NSArray ?? [])
                        
                        self.hitsArray = dict?.value(forKey: "hits") as? NSArray ?? []
                        self.listTableView.reloadData()
                   }
                case .failure(let error):
                    print(error)
                }


            }
        
        
        
        
        

        

    }
    
    
    

}



extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hitsArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListTableViewCell
        cell.titleLabel.text = (hitsArray?[indexPath.row] as! NSDictionary).value(forKey: "title") as? String
        cell.createdDateLabel.text = (hitsArray?[indexPath.row] as! NSDictionary).value(forKey: "created_at") as? String
        
        return cell
    }
}
