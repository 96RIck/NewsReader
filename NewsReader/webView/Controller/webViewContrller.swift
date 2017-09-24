//
//  webViewContrller.swift
//  NewsReader
//
//  Created by Rick on 2017/9/23.
//  Copyright © 2017年 Rick. All rights reserved.
//

import UIKit

class webViewContrller: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var url : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
         webView.loadRequest(URLRequest(url: URL(string: url!)!)) 
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
