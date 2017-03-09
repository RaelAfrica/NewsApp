//
//  ArticleListTableViewController.swift
//  Newz
//
//  Created by Rael Kenny on 3/6/17.
//  Copyright © 2017 Rael Kenny. All rights reserved.
//

import UIKit

class ArticleListTableViewController: UITableViewController {

    var articles = [Article]()  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getNews(section: "world")
        
        //this is a custom cell: XIB
        // 1. get the xib (custom cell)
        // 2. register the tableview cell using the xib
        
        let nib = UINib.init(nibName: "ArticleTableViewCell", bundle: nil) // 1.
        
        self.tableView.register(nib, forCellReuseIdentifier: "articleCell") // 2.
        
    }

    func getNews(section:String){
        let urlString = "https://api.nytimes.com/svc/topstories/v2/\(section).json?api-key=bdbf3dea91ed4eb388d6e2e823f99f9b"
        
        //convert string to URL object .1
        //create a URL session .2
        
        
        let url = URL(string: urlString)! //1
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in //2
            
            guard let myData = data
                else { return }
            
            guard let json = try? JSONSerialization.jsonObject(with: myData, options: []) as! [String:AnyObject]
                else { return }
            
            //get the results array from the JSON dictionary
            let results = json["results"]! as! [AnyObject]
            
            for result in results {
                
                guard let title = result["title"] as? String,
                    let author = result["byline"] as? String,
                    let abstract = result["abstract"] as? String,
                    let url = result["url"] as? String,
                    let date = result["published_date"] as? String
                    else { continue }
            
                guard let link = URL(string:url)
                    else { continue }
                
                guard let multimedia = result["multimedia"] as? [AnyObject]
                    else { continue }
                
                guard multimedia.count > 0
                    else { continue }
                
                let imageMetadata = multimedia.last as! [String: AnyObject]
                guard let imageURLString = imageMetadata ["url"]! as? String
                    else { continue }
                
                guard let imageURL = URL(string:imageURLString)
                    else { continue }
                
                let newArticle = Article(title: title, author: author, abstract: abstract, date: date, imageURL: imageURL, link: link)
            } 
            
            
        }.resume()
    }
    
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath)

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160.0
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
