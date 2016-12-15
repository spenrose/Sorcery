//
//  BlockCollectionViewController.swift
//  Pods
//
//  Created by Adam Cumiskey on 11/10/16.
//
//

import Foundation


public protocol ConfigurableCollection: class {
    var dataSource: CollectionData? { get set }
    func configureDataSource(dataSource: CollectionData)
}

public extension ConfigurableCollection where Self: UICollectionViewController {
    public func reloadUI() {
        guard let collectionView = collectionView else { return }
        
        let dataSource = CollectionData()
        configureDataSource(dataSource: dataSource)
        
        dataSource.registerReuseIdentifiers(to: collectionView)
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
        collectionView.reloadData()
        
        self.dataSource = dataSource
    }
}



open class BlockCollectionViewController: UICollectionViewController, ConfigurableCollection {
    public var dataSource: CollectionData?
    
    open func configureDataSource(dataSource: CollectionData) {
        // Base class does nothing
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadUI()
    }
}
