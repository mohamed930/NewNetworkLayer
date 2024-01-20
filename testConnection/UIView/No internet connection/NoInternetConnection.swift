//
//  NoInternetConnection.swift
//  testConnection
//
//  Created by Mohamed Ali on 20/01/2024.
//

import UIKit
import Combine

class NoInternetConnection: UIView {
    
    var buttonTappedPublisher = PassthroughSubject<Void,Never>()
    var cancellables = Set<AnyCancellable>()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    private func configureView() {
        guard let view = self.loadViewFromNib(nibName: "NoInternetConnection") else { return }
        
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    @IBAction func tryAgainButtonAction (_ sender: Any) {
        buttonTappedPublisher.send()
    }
    
}
