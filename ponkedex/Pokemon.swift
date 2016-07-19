//
//  Pokemon.swift
//  ponkedex
//
//  Created by Edward on 7/18/16.
//  Copyright © 2016 Edward. All rights reserved.
//

import Foundation

//pokemon 的类，代表小精灵
class Pokemon {
    //设置类中变量，作为属性
    private var _name: String!
    private var _pokedexId: Int!
    
    //因为private，外部访问所以var
    var name: String{
        return _name
    }
    var pokedexId: Int{
        return _pokedexId
    }
    //初始化
    init(name: String, pokedexId: Int){
        self._name = name
        self._pokedexId = pokedexId
    }
}