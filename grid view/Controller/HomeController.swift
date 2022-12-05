//
//  HomeController.swift
//  Side Menu Bar prog
//
//  Created by Admin on 25/11/22.
//

import UIKit

class HomeController: UIViewController {
    
    var delegate:HomeControllerDelegate!
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let searchBar = UISearchBar()
    let data = ["one","two","three","four","five","six","seven"]
    var filterData:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        
        filterData = data
        configureSearchBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .white

    }
    
    func configureNavigationBar(){
        print("navigation bar")
       navigationController?.navigationBar.barTintColor = .darkGray
       navigationController?.navigationBar.barStyle = .default
        navigationItem.title = "Keep Note"
        var menubtn = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .done, target: self, action: #selector(handleMenuToggle))
        self.navigationItem.leftBarButtonItem = menubtn
        menubtn.tintColor = UIColor.black
    }
    @objc func handleMenuToggle(){
        print("menu button clicked")
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    
    func configureSearchBar(){
       
        searchBar.sizeToFit()
        searchBar.delegate = self
        
        //view.backgroundColor = .white
        
       // navigationController?.navigationBar.prefersLargeTitles = true
        //navigationItem.title = "Search Bar"
        navigationController?.navigationBar.barTintColor = UIColor(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.tintColor = .black
        
        showSearchBarButton(shouldShow: true)
        
    }
    func showSearchBarButton(shouldShow: Bool) {
        if shouldShow{
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleShowSearchBar))
        }else{
            navigationItem.rightBarButtonItem = nil
        }
    }
    @objc func handleShowSearchBar(){
    //        navigationItem.titleView = searchBar
    //        searchBar.showsCancelButton = true
          //  navigationItem.rightBarButtonItem = nil
            search(shouldShow: true)
            searchBar.becomeFirstResponder()
        }
    func search(shouldShow: Bool) {
            showSearchBarButton(shouldShow: !shouldShow)
            searchBar.showsCancelButton = shouldShow
            navigationItem.titleView = shouldShow ? searchBar : nil
        }
}
    
    extension HomeController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return data.count
        }
        
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
            
            cell.namelbl.text = data[indexPath.row]
            cell.agelbl.text = "20"
            cell.layer.cornerRadius = 10
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.blue.cgColor
            return cell
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: (collectionView.frame.size.width / 3) - 3,
                          height: (collectionView.frame.size.width / 3) - 3)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 1
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 1
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            collectionView.deselectItem(at: indexPath, animated: true)
            print("Selected index \(indexPath.section) and row: \(indexPath.row)")
        }
    }

extension HomeController: UISearchBarDelegate{
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            print("did taped cancle")
            // we have use the same line of code inside the search funcion
            //        navigationItem.titleView = nil
            //        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleShowSearchBar))
            //        searchBar.showsCancelButton = false
            
            search(shouldShow: false)
            
        }
}
