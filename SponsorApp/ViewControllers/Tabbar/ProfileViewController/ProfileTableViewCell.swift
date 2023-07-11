//
//  ProfileTableViewCell.swift
//  SponsorApp
//
//  Created by Can Duru on 14.11.2022.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    static let identifer = "profileTableViewCell"
    
    var titleLabel:UILabel!
    var imagePlace: UIImageView!
    var eventsView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: ProfileTableViewCell.identifer)
        configureViews()
    }
    
    func configureViews(){
        
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .systemGray
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        self.addSubview(titleLabel)
        
        imagePlace = UIImageView()
        imagePlace.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imagePlace)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: imagePlace.trailingAnchor, constant: 10),
            
            imagePlace.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            imagePlace.widthAnchor.constraint(equalToConstant: 30),
            imagePlace.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            imagePlace.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
