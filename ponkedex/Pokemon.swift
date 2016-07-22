//
//  Pokemon.swift
//  ponkedex
//
//  Created by Edward on 7/18/16.
//  Copyright © 2016 Edward. All rights reserved.
//

import Foundation
import Alamofire

//pokemon 的类，代表小精灵
class Pokemon {
    //设置类中变量，作为属性
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionTxt: String!
    
    
    private var _pokemonUrl: String!
    //因为private，外部访问所以var
    var name: String{
        return _name
    }
    var pokedexId: Int{
        return _pokedexId
    }
    var description: String{
        return _description
    }
    var type: String{
        return _type
    }
    var defense: String{
        return _defense
    }
    var height: String{
        return _height
    }
    var weight: String{
        return _weight
    }
    var attack: String{
        return _attack
    }
    var nextEvolutionTxt: String{
        return _nextEvolutionTxt
    }
    
    
    //初始化
    init(name: String, pokedexId: Int, description: String, attack: String, defense: String, height: String, nextEvolutionTxt: String){
        self._name = name
        self._pokedexId = pokedexId
        self._description = description
        self._attack = attack
        self._defense = defense
        
        self._height = height
        self._nextEvolutionTxt = nextEvolutionTxt
        
        _pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(self._pokedexId)/"
        
    }
    
    func downloadPokemonDetails(completed: DownloadComplete){
        let url = NSURL(string: _pokemonUrl)!
        Alamofire.request(.GET, url).responseJSON{ Response in
            let result = Response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject>{
                if let weight = dict["weight"] as? String{
                    self._weight = weight
                }
                if let height = dict["height"] as? String{
                    self._height = height
                }
                if let attack = dict["attack"] as? Int{
                    self._attack = "\(attack)"
                }
                if let defense = dict["defense"] as? Int{
                    self._defense = "\(defense)"
                }
                if let types = dict["types"] as? [Dictionary<String, String>] where types.count > 0{
                    if let types = types[0]["name"]
                    {
                        self._type = self.name.capitalizedString
                    }
                    if types.count > 1
                    {
                        for var x=1; x<types.count; x++
                        {
                            if let name = types[x]["name"]
                            {
                               self._type! += "/\(name.capitalizedString)"
                            }
                        }
                    }
                }else{
                    self._type = ""
                }
                print(self._type)
            
            }
        }

    }
}