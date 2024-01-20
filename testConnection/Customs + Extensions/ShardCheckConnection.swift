//
//  ShardCheckConnection.swift
//  testConnection
//
//  Created by Mohamed Ali on 20/01/2024.
//

import Foundation
import Combine

class ShardCheckConnection {
    static let shared = ShardCheckConnection()
    
    private var connection = CheckConnection()
    private var cancellable = Set<AnyCancellable>()
    var connectionStatusObservable: AnyPublisher<CheckConnection.connectionStatus,Never> {
        return connection.connectionStatusObservable.eraseToAnyPublisher()
    }
    
    init() {
        connection.startNotify()
    }
    
    func checkNetwork() {
        connection = CheckConnection()
        connection.startNotify()
    }
}
