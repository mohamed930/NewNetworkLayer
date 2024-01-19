//
//  UICollectionView.swift
//  testConnection
//
//  Created by Mohamed Ali on 19/01/2024.
//

import UIKit

protocol Reusable {
    static var identifier: String { get }
}

extension Reusable {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionView: Reusable {

    func registerNib<Cell: UICollectionViewCell>(cell: Cell.Type) {
        let nibName = Cell.identifier
        self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
    }
    
    func dequeue<Cell: UICollectionViewCell>(indexPath: IndexPath) -> Cell {
        let nibName = Cell.identifier
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: nibName, for: indexPath) as? Cell else {
            fatalError("Error in cell")
        }
        return cell
    }
    
}

extension UICollectionViewCell: Reusable {}
