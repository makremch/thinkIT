//
//  ArticleViewControllerCell.swift
//  ThinkIT
//
//  Created by Makrem chambah on 29/12/2020.
//

import Foundation
import UIKit


class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewArticle      : UIView!
    @IBOutlet weak var imageViewArticle : UIImageView!
    @IBOutlet weak var NameLabel        : UILabel!
    @IBOutlet weak var participantLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.designOutlets()
    }
    
    
    func designOutlets(){
        viewArticle.layer.cornerRadius       = 10
        viewArticle.backgroundColor          = UIColor.white
        viewArticle.layer.shadowColor        = UIColor.systemGray3.cgColor
        viewArticle.layer.shadowColor        = UIColor.systemGray2.cgColor
        viewArticle.layer.shadowOpacity      = 1
        viewArticle.layer.shadowOffset       = .zero
        viewArticle.layer.shadowRadius       = 7
        viewArticle.layer.shadowPath         = UIBezierPath(rect: viewArticle.bounds).cgPath
        viewArticle.layer.shouldRasterize    = true
        viewArticle.layer.rasterizationScale = UIScreen.main.scale
        viewArticle.layer.borderWidth        = 1
        viewArticle.layer.borderColor        = UIColor.systemGray5.cgColor
        
        imageViewArticle.layer.cornerRadius       = 10
        imageViewArticle.backgroundColor          = UIColor.white
        imageViewArticle.layer.shadowColor        = UIColor.systemGray3.cgColor
        imageViewArticle.layer.shadowColor        = UIColor.systemGray3.cgColor
        imageViewArticle.layer.shadowOpacity      = 1
        imageViewArticle.layer.shadowOffset       = .zero
        imageViewArticle.layer.shadowRadius       = 5
        imageViewArticle.layer.shadowPath         = UIBezierPath(rect: imageViewArticle.bounds).cgPath
        imageViewArticle.layer.shouldRasterize    = true
        imageViewArticle.layer.rasterizationScale = UIScreen.main.scale
        imageViewArticle.layer.borderWidth        = 1
        imageViewArticle.layer.borderColor        = UIColor.systemGray5.cgColor
    }
    
    
}
