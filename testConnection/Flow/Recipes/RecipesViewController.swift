//
//  RecipesViewController.swift
//  testConnection
//
//  Created by Mohamed Ali on 19/01/2024.
//

import UIKit
import Combine

class RecipesViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewmodel = RecipesViewModel()
    private var cancellables = Set<AnyCancellable>()
    private var hits = Array<Hit>()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true
        regiesterCollectionView()
        subscribeToLoadingIndecator()
        subscribeToResponsePublisher()
        fetchData()
    }
    
    func regiesterCollectionView() {
        collectionView.registerNib(cell: RecipesCell.self)
    }
    
    func subscribeToLoadingIndecator() {
        viewmodel.isloadingPublisher.sink(receiveValue: { [weak self] isloading in
            guard let self = self else { return }
            
            if isloading {
                self.startLoading()
            }
            else {
                self.dismissLoading()
            }
            
        }).store(in: &cancellables)
    }
    
    func subscribeToResponsePublisher() {
        viewmodel.responsePublisher.sink(receiveValue: { [weak self] hits in
            guard let self = self else { return }
            
            self.hits = hits
            self.collectionView.reloadData()
        }).store(in: &cancellables)
    }
    
    func fetchData() {
        viewmodel.fetchDataOperation()
    }
}

extension RecipesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hits.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(indexPath: indexPath) as RecipesCell
        
        cell.configureCell(hits[indexPath.row].recipe)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 16) / 2
        return CGSize(width: width, height: width)
    }
}
