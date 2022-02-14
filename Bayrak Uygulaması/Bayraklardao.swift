//
//  Bayraklardao.swift
//  Bayrak Uygulaması
//
//  Created by KERİM İSMAİL TURHAN on 15.12.2021.
//

import Foundation


class Bayraklardao {
    
    
    let db:FMDatabase?
    
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veriTabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("bayrakquiz.sqlite")
        
        db = FMDatabase(path: veriTabaniURL.path)
    }
    
    func rasgele5Getir() -> [Bayraklar] {
        var liste = [Bayraklar]()
        db?.open()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM bayraklar ORDER BY RANDOM() LIMIT 5 ", values: nil)
            
            while(rs.next()){
                
                let bayrak = Bayraklar(bayrak_id: Int(rs.string(forColumn: "bayrak_id"))!
                                       , bayrak_ad: rs.string(forColumn: "bayrak_ad")!
                                       , bayrak_resim: rs.string(forColumn: "bayrak_resim")!)
                liste.append(bayrak)
                
            }
            
        } catch  {
            print(error.localizedDescription)
        }
    
        db?.close()
        
        return liste
    }
    
    func rasgele3YanlisSecenekGetir(bayrak_id:Int) -> [Bayraklar] {
        var liste = [Bayraklar]()
        db?.open()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM bayraklar WHERE bayrak_id != ? ORDER BY RANDOM() LIMIT 3 ", values: [bayrak_id])
            
            while(rs.next()){
                
                let bayrak = Bayraklar(bayrak_id: Int(rs.string(forColumn: "bayrak_id"))!
                                       , bayrak_ad: rs.string(forColumn: "bayrak_ad")!
                                       , bayrak_resim: rs.string(forColumn: "bayrak_resim")!)
                liste.append(bayrak)
                
            }
            
        } catch  {
            print(error.localizedDescription)
        }
    
        db?.close()
        
        return liste
    }
    
    
    
}
