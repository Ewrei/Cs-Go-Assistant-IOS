//
//  SearchResultViewController.swift
//  CsGo Test
//
//  Created by Виталий on 10/22/20.
//  Copyright © 2020 Виталий. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

final class SearchResultViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    fileprivate var products = [UserModel]()

    fileprivate lazy var emptyView: SearchEmptyView = {
        let view = SearchEmptyView().loadNib() as! SearchEmptyView
        view.topConstraint.constant = UIScreen.main.bounds.height / 4
        return view
    }()
    
    fileprivate var searchDataRequest: DataRequest?

    var searchString: String? {
        didSet {
            performSearch()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "SearchUserCell", bundle: nil), forCellWithReuseIdentifier: SearchUserCell.cellId)
        collectionView.alwaysBounceVertical = true
        collectionView.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0)
        collectionView.keyboardDismissMode = .onDrag
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        NotificationCenter.default.addObserver(self, selector: #selector(updateProductState), name: .productStateUpdated, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(performSearch), name: .shoppingCartSubmitted, object: nil)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK - Private
    
    @objc fileprivate func updateProductState(notification: Notification) {
        guard let productState = notification.object as? UserModel.State else { return }
        guard let index = products.firstIndex(where: { $0.id == productState.productId }) else { return }
        products[index].quantity = productState.quantity
        products[index].available = productState.available
        collectionView.reloadItems(at: [IndexPath(item: index, section: 0)])
    }
    
    @objc fileprivate func performSearch() {
        
        searchDataRequest?.cancel()
    
        guard let searchText = searchString?.trim().lowercased(), searchText.isNotEmpty, searchText.count >= 3 else {
            products = []
            collectionView.reloadDataAnimated()
            return
        }
        
        searchDataRequest = ApiClient.request(.getSearchUser(text: "sess", sessionid: "Ewrei", filter: "users", steamid_user: "false", page: 1)) { [weak self] (result: Result<[UserModel], Error>) in
            guard let self = self else { return }
            
            switch result {
            case let .success(products):
                self.products = products
                self.collectionView.backgroundView = products.isEmpty ? self.emptyView : nil
            case .failure:
                self.products = []
            }

            self.collectionView.reloadDataAnimated()
        }
    }

    fileprivate func showProduct(at indexPath: IndexPath) {
//        let vc = RoutingHelper.storyboard(.product)?.instantiateInitialViewController() as! SearchViewController
//        vc.product = products[indexPath.item]
//        present(vc, animated: true)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchUserCell.cellId, for: indexPath) as! SearchUserCell
        cell.product = products[indexPath.item]
        cell.titleLabel.numberOfLines = 3
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sectionInset: CGFloat = 10
        let width = (collectionView.bounds.width - sectionInset * 3) / 2
        return CGSize(width: width, height: width * 1.4)
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        showProduct(at: indexPath)
    }
}
