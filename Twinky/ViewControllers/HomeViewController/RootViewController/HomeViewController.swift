//
//  HomeViewController.swift
//  Twinky
//
//  Created by Евгений Митюля on 11/28/23.
//

import UIKit
import SnapKit

protocol HomeViewInput: AnyObject {
    func configureUI()
}

class HomeViewController: UIViewController {
    public var output: HomeViewOutput?
    
    private var searchActive: Bool = false
    
    private let movieGenres = ["Action", "Adventure", "Comedy", "Drama", "Fantasy", "Horror", "Mystery", "Romance", "Sci-Fi", "Thriller", "Animation", "Documentary", "Crime", "Family", "History", "Music", "Sport", "War", "Biography", "Western", "Musical", "Romantic Comedy", "Superhero", "Spy", "Supernatural"]
    
    private lazy var filtered = movieGenres
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Discover Movies"
        lbl.font = UIFont.sourceSans(ofSize: 35, style: .bold)
        lbl.textColor = .titleColor
        return lbl
    }()
    
    private lazy var listButton: UIButton = {
        let btn = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 35)
        let settingsImage = UIImage(systemName: Icons.list, withConfiguration: config)?.withTintColor(.iconColor, renderingMode: .alwaysOriginal)
        let settingsImageTapped = UIImage(systemName: Icons.list, withConfiguration: config)?.withTintColor(.iconTouched, renderingMode: .alwaysOriginal)
        
        btn.setImage(settingsImage, for: .normal)
        btn.setImage(settingsImageTapped, for: .highlighted)
        
        return btn
    }()
    
    private lazy var searchBar: UISearchBar = {
        
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.returnKeyType = .search
        searchBar.showsCancelButton = false
        searchBar.showsBookmarkButton = false
        searchBar.sizeToFit()
        
        searchBar.searchTextField.placeholder = "Search Movies"
        searchBar.searchTextField.layer.cornerRadius = 24
        searchBar.searchTextField.backgroundColor = .systemGray4
        searchBar.searchTextField.font = .sourceSans(ofSize: 18, style: .regular)
        
        self.definesPresentationContext = false
        searchBar.delegate = self
        return searchBar
        
    }()
    //    private lazy var searchTextField: TextFieldWithPadding = {
    //        let tf = TextFieldWithPadding()
    //
    //        tf.borderStyle = .roundedRect
    //        tf.layer.cornerRadius = 24
    //        tf.backgroundColor = .systemGray4
    //        tf.clipsToBounds = true
    //
    //
    //
    //        tf.rightView = TextFieldIconView.create(
    //            size: 40,
    //            image: "magnifyingglass",
    //            color: .titleColor,
    //            contentMode: .left
    //        )
    //        tf.rightViewMode = .always
    //
    //        tf.placeholder = "Search movies"
    //        tf.font = .sourceSans(ofSize: 18, style: .regular)
    //        tf.contentVerticalAlignment = .center
    //
    //        tf.autocorrectionType = UITextAutocorrectionType.no
    //        tf.keyboardType = UIKeyboardType.default
    //        tf.returnKeyType = UIReturnKeyType.done
    //        tf.clearButtonMode = UITextField.ViewMode.whileEditing
    //
    //        tf.delegate = self
    //        return tf
    //    }()
    
    private lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewFlowLayout()
        )
        
        cv.backgroundColor = .clear
        
        cv.showsVerticalScrollIndicator = false
        cv.bounces = false
        
        cv.delegate = self
        cv.dataSource = self
        cv.register(GenreCell.self, forCellWithReuseIdentifier: GenreCell.identifier)
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
    }
    
    @objc func listButtonTouchUpInside() {
        output?.listButtonTapped()
    }
    
}

extension HomeViewController: HomeViewInput {
    func configureUI() {
        view.backgroundColor = .backgroundView
        view.addSubview(titleLabel)
        view.addSubview(listButton)
        view.addSubview(searchBar)
        view.addSubview(collectionView)
        
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(20)
            $0.top.equalTo(60)
        }
        
        listButton.snp.makeConstraints {
            $0.right.equalTo(-20)
            $0.centerY.equalTo(titleLabel)
        }
        //                listButton.addTarget(self, action: #selector(listButtonTouchUpInside), for: .touchUpInside)
        
        searchBar.snp.makeConstraints {
            $0.right.equalTo(-20)
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.left.equalTo(20)
            $0.height.equalTo(50)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(20)
            $0.left.equalTo(30)
            $0.right.equalTo(-30)
            $0.bottom.equalTo(-100)
        }
    }
    
}

extension HomeViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
        self.searchBar.showsCancelButton = true
        self.collectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.text = ""
        searchActive = false
        self.searchBar.showsCancelButton = false
        self.searchBar.endEditing(true)
        self.dismiss(animated: true, completion: nil)
        self.collectionView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text! == " "  {
            filtered = movieGenres
            collectionView.reloadData()
        } else {
            
            filtered = movieGenres.filter({ (item) -> Bool in
                
                return (item.localizedCaseInsensitiveContains(String(searchBar.text!)))
                
            })
            if filtered == [] {
                filtered = movieGenres
            }
            collectionView.reloadData()
        }
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        collectionView.reloadData()
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = view.frame.width * 0.33 - 30
        return CGSize(width: cellSize, height: cellSize)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filtered.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "GenreCell",
            for: indexPath
        ) as? GenreCell
        else { return UICollectionViewCell() }
        cell.configure(withGenre: filtered[indexPath.row])
        return cell
    }
}
