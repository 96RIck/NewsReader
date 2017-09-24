//
//  ViewController.swift
//  NewsReader
//
//  Created by Rick on 2017/9/23.
//  Copyright © 2017年 Rick. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var tableView: UITableView!
    
    var articles : [Newslist]? = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //    tableView.delegate = self
    //    tableView.dataSource = self
        fetchArticle()
    }

    
    func fetchArticle()  {
        
        
   //  let url = "https://newsapi.org/v1/articles?source=techcrunch&sortBy=top&apiKey=ece152251ddd49caaab0532bd1a4846e"
      //  Alamofire.request(url, method: .get, parameters: Parameters, encoding: UTF8)
        
        let urlRequest = URLRequest(url: URL(string: "http://api.tianapi.com/keji/?key=ad6535b01e87328094ddd40cc4f2759b&num=10")!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            self.articles = [Newslist]()
            
            do
            {
                
                let json = try JSONSerialization .jsonObject(with: data! , options: .mutableContainers) as! [String : AnyObject]
             
                if let articlesFromeJson = json ["newslist"] as? [[String : AnyObject]] {
                    for articleFromeJson in articlesFromeJson {
                        let newslist = Newslist()
                        if let author = articleFromeJson["ctime"] as? String, let title = articleFromeJson["title"] as? String, let desc = articleFromeJson["description"] as? String, let urlToImage = articleFromeJson["picUrl"] as? String, let url = articleFromeJson["url"] as? String  {
                         
                            newslist.author = author
                            newslist.headLine = title
                            newslist.desc = desc
                            newslist.url = url
                            newslist.imageUrl = urlToImage
                        }
                        self.articles?.append(newslist)
                    }
                }
                //异步加载
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch let error {
                print(error)
                 }
            
        }
        task.resume()
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! ArticleCell
       
        cell.title.text = articles?[indexPath.row].headLine
        cell.author.text = articles?[indexPath.row].author
        cell.desc.text = articles?[indexPath.row].desc
        cell.ArticleImageView.downLoadImage(from: (self.articles?[indexPath.row].imageUrl)!)
        cell.title.textAlignment = .left
        
    
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "web") as! webViewContrller
        webVC.url = self.articles?[indexPath.row].url
        self.present(webVC, animated: true, completion:  nil)
    }
    
    
}

extension  UIImageView {
    func downLoadImage(from url: String) {
        let urlRequest = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) {(data,responds,error) in
            
            if error != nil {
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
                
            }
        }
        
         task.resume()
    }
}











