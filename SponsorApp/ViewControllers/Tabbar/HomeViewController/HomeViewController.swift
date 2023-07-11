//
//  HomeViewController.swift
//  SponsorApp
//
//  Created by Can Duru on 20.09.2022.
//

import UIKit
import SideMenu

class HomeViewController: UIViewController {

    
    //MARK: Side Menu Setup
    var menu: SideMenuNavigationController?
    lazy var menuBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "sidebar.leading")?.withRenderingMode(.alwaysOriginal).withTintColor(.systemBlue), style: .done, target: self, action: #selector(menuBarButtonItemTapped))
    @objc
    func menuBarButtonItemTapped(){
         present(menu!, animated: true)
    }
    lazy var menuView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()

    //MARK: Collection View Setup
    var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "BeMySponsor"
        navigationItem.setLeftBarButton(menuBarButtonItem, animated: false)
        menu = SideMenuNavigationController(rootViewController: MenuListController())
        menu?.leftSide = true
        
        configureCollectionView()
    }
    
    func loadContent(){
        var loadCheck = 0
        
        //Firebase load
        //isim
        //foto
        //yazı
            
        //Load
        while loadCheck == 0 {
            //Activity Indıcator and all hidden
            
            //all shown
        }
    }
    
    private func configureCollectionView(){
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createFlowLayout())
        view.addSubview(collectionView)
        
        collectionView.register(FeedHeaderViewCell.self, forCellWithReuseIdentifier: FeedHeaderViewCell.identifier)
        collectionView.register(FeedCaptionViewCell.self, forCellWithReuseIdentifier: FeedCaptionViewCell.identifier)
        collectionView.register(FeedLikeViewCell.self, forCellWithReuseIdentifier: FeedLikeViewCell.identifier)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "feed")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        
        self.collectionView = collectionView
    }
    
    private func createFlowLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnv in
            return self.createFeedLayout()
        }
        return layout
    }
    
    private func createFeedLayout() -> NSCollectionLayoutSection {
        let postHeaderItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60)))
        let postCaptionItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)))
        let postImageItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1)))
        let postCommentSectionItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(55)))
        
        
        let feedGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500)), subitems: [postHeaderItem, postCaptionItem, postImageItem, postCommentSectionItem])
        
        let feedSection = NSCollectionLayoutSection(group: feedGroup)
        
        return feedSection
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "feed", for: indexPath)
        
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedHeaderViewCell.identifier, for: indexPath)
            return cell
            
        } else if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCaptionViewCell.identifier, for: indexPath)
            return cell
            
        } else if indexPath.row == 2 {
            let image = UIImageView(image: UIImage(named: "Logo"))
            image.contentMode = .scaleAspectFill
            image.clipsToBounds = true
            cell.backgroundView = image
            return cell
            
        } else if indexPath.row == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedLikeViewCell.identifier, for: indexPath)
            return cell
        }
        
        return cell
    }
}
