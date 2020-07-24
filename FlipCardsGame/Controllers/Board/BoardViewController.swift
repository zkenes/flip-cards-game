//
//  BoardViewController.swift
//  FlipCardsGame
//
//  Created by Zhanserik Kenes on 7/24/20.
//  Copyright © 2020 Zhanserik Kenes. All rights reserved.
//

import UIKit

class BoardViewController: UIViewController {
    var item: MenuItem?
    
    var cardsValue: String?
    
    private let defaultMargin: CGFloat = 8.0
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = self.defaultMargin
        layout.minimumLineSpacing = self.defaultMargin
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        view.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
        view.backgroundColor = .white
        return view
    }()
    
    private func updateUI() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let item = item else { return }
        self.title = item.title
        cardsValue = CardProvider().generateCards(item: item)
        collectionView.reloadData()
    }
}

extension BoardViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let item = item else { return 0 }
        return item.columns * item.rows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as! CardCollectionViewCell
        if let cardsValue = cardsValue {
            let index = cardsValue.index(cardsValue.startIndex, offsetBy: indexPath.row)
            cell.value = String(cardsValue[index])
        }
        return cell
    }
}

extension BoardViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.isSelected = true
    }
}

extension BoardViewController: UICollectionViewDelegateFlowLayout {
    
    private func itemSize() -> CGSize {
        guard let item = item else { return .zero }
        let width = UIScreen.main.bounds.width
        let col = CGFloat(item.columns)
        let cellSide = (width - (col - 1) * self.defaultMargin) / col
        return CGSize(width: cellSide, height: cellSide)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize()
    }
}
