//
//  ArticleCell.swift
//  NewsReader
//
//  Created by Rick on 2017/9/23.
//  Copyright © 2017年 Rick. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {

   

    @IBOutlet weak var ArticleImageView: UIImageView!
   
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var desc: UILabel!
    
    @IBOutlet weak var author: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
