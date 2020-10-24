//
//  SearchUserCell.swift
//  CsGo Test
//
//  Created by Виталий on 10/23/20.
//  Copyright © 2020 Виталий. All rights reserved.
//

import UIKit

class SearchUserCell: UICollectionViewCell {
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var oldPriceLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var orderButtonView: UIView!
    
    fileprivate var currentQuantity = 0 {
        didSet {
            refreshShoppingButton()
        }
    }
    
    //fileprivate let debounceQuantityInterval: TimeInterval = 0.4
    //fileprivate var pendingRequestWorkItem: DispatchWorkItem?

    var product: UserModel? {
        didSet {
            guard let product = product else { return }

          //  titleImageView.kf.setImage(with: product.images.first?.encodedUrl)
            titleLabel.text = product.name

            currentQuantity = product.quantity
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        orderButtonView.layer.cornerRadius = 10
       // discountLabel.insets = UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 6)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
     //  titleImageView.kf.cancelDownloadTask()
        titleImageView.image = nil
    }

    @IBAction func addToShoppingCart(_ sender: Any) {
        guard let product = product else { return }
        if product.quantity == 0 {
            addQuantity(1)
        }
    }

    @IBAction func plusAction(_ sender: Any) {
        addQuantity(1)
    }

    @IBAction func minusAction(_ sender: Any) {
        addQuantity(-1)
    }
    
    fileprivate func addQuantity(_ quantity: Int) {
        //pendingRequestWorkItem?.cancel()
        
        currentQuantity = max(currentQuantity + quantity, 0)
        
        //let requestWorkItem = DispatchWorkItem {
            self.orderItem()
        //}

        //pendingRequestWorkItem = requestWorkItem

        //DispatchQueue.main.asyncAfter(deadline: .now() + debounceQuantityInterval, execute: requestWorkItem)
    }

    fileprivate func refreshShoppingButton() {
        DispatchQueue.main.async {
            guard let product = self.product else { return }
            if product.available == 0 && product.quantity == 0 {
                self.plusButton.isHidden = true
                self.minusButton.isHidden = true
                
                self.orderButtonView.backgroundColor = UIColor(hex: "#F6F6F6")
                self.orderButtonView.layer.borderColor = UIColor(hex: "#E7E7E7")?.cgColor
                self.orderButtonView.layer.borderWidth = 1
                
                self.orderButton.setTitle("Раскупили", for: .normal)
                self.orderButton.setTitleColor(UIColor(hex: "#B2B2B2"), for: .normal)
            } else if self.currentQuantity > 0 {
                self.plusButton.isHidden = false
                self.minusButton.isHidden = false
                
                self.orderButtonView.layer.borderColor = UIColor.clear.cgColor
                self.orderButtonView.layer.borderWidth = 1
                self.orderButtonView.backgroundColor = Styling.tintColor
                
                self.orderButton.setTitleColor(.white, for: .normal)
                self.orderButton.setTitle("\(self.currentQuantity) шт", for: .normal)
            } else {
                self.plusButton.isHidden = true
                self.minusButton.isHidden = true
                
                self.orderButtonView.layer.borderColor = UIColor(hex: "#F8E8E6")?.cgColor
                self.orderButtonView.layer.borderWidth = 1
                self.orderButtonView.backgroundColor = UIColor(hex: "#FFFAFA")
                
                self.orderButton.setTitleColor(Styling.tintColor, for: .normal)
                self.orderButton.setTitle("В корзину", for: .normal)
            }
        }
    }

    fileprivate func orderItem() {
        guard let product = product else { return }
        
//        ApiClient.orderItem(product: product, quantity: currentQuantity) { [weak self] error in
//            guard let self = self else { return }
//            if error == nil {
//                self.product?.quantity = self.currentQuantity
//                AnalyticsHelper.logAddProductToCart(product)
//            } else {
//                self.currentQuantity = product.quantity
//                self.orderButtonView.shake(offset: 8)
//            }
//        }
    }

}
