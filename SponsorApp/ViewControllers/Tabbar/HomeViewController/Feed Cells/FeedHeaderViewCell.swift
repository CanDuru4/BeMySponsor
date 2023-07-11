//
//  FeedHeaderViewCell.swift
//  SponsorApp
//
//  Created by Can Duru on 13.11.2022.
//

import UIKit

class FeedHeaderViewCell: UICollectionViewCell {
    
    static let identifier = "FeedHeaderViewCell"
    
    let userProfilePictureImageView = UIImageView()
    let userNameLabel = UILabel()
    let moreImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubview(userProfilePictureImageView)
        userProfilePictureImageView.translatesAutoresizingMaskIntoConstraints = false
        userProfilePictureImageView.contentMode = .scaleAspectFill
        userProfilePictureImageView.clipsToBounds = true
        userProfilePictureImageView.layer.cornerRadius = 16
        userProfilePictureImageView.image = UIImage(named: "Logo")
        
        addSubview(userNameLabel)
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        userNameLabel.text = "Can Duru"
        
        addSubview(moreImageView)
        moreImageView.translatesAutoresizingMaskIntoConstraints = false
        moreImageView.contentMode = .scaleAspectFit
        moreImageView.image = UIImage(systemName: "ellipsis")
        moreImageView.tintColor = .label
        
        
        NSLayoutConstraint.activate([
            userProfilePictureImageView.centerYAnchor.constraint(equalTo: centerYAnchor), userProfilePictureImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12), userProfilePictureImageView.widthAnchor.constraint(equalToConstant: 32), userProfilePictureImageView.heightAnchor.constraint(equalToConstant: 32),
            
            userNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            userNameLabel.leadingAnchor.constraint(equalTo: userProfilePictureImageView.trailingAnchor, constant: 8),
            
            moreImageView.centerYAnchor.constraint(equalTo: centerYAnchor), moreImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24), moreImageView.widthAnchor.constraint(equalToConstant: 28), moreImageView.heightAnchor.constraint(equalToConstant: 28),
        ])
    }
}
