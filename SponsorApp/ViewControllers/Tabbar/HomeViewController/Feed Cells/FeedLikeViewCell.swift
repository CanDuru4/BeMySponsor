//
//  FeedLikeViewCell.swift
//  SponsorApp
//
//  Created by Can Duru on 13.11.2022.
//

import UIKit

class FeedLikeViewCell: UICollectionViewCell {
    static let identifier = "FeedLikeViewCell"
    
    let likeLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubview(likeLabel)
        likeLabel.translatesAutoresizingMaskIntoConstraints = false
        likeLabel.font = .systemFont(ofSize: 14, weight: .bold)
        likeLabel.textColor = .systemGray
        likeLabel.numberOfLines = 1
        likeLabel.text = "Published on 13 November 2022"
        
        NSLayoutConstraint.activate([
            likeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            likeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            likeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }

}
