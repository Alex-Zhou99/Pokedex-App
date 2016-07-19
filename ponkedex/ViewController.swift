//
//  ViewController.swift
//  ponkedex
//
//  Created by Edward on 7/18/16.
//  Copyright © 2016 Edward. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collection: UICollectionView!
    //开始就载入的函数
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //delegate，代表；指令，设置collection的各种显示
        collection.delegate = self
        collection.dataSource = self
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokeCell", forIndexPath: indexPath) as? PokeCellCollectionViewCell{
            var pokemon = Pokemon(name: "Test", pokedexId: indexPath.row)
            cell.configureCell(pokemon)
            return cell
        }else{
            return UICollectionViewCell()
        }
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //一共显示有多少个
        return 718
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //整个布局有几个部分
        return 1
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        //就是那个图片的大小
        return CGSizeMake(105, 105)
    }
}

