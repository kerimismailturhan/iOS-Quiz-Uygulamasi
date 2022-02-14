//
//  sonucEkraniViewController.swift
//  Bayrak Uygulaması
//
//  Created by KERİM İSMAİL TURHAN on 15.12.2021.
//

import UIKit

class sonucEkraniViewController: UIViewController {

    @IBOutlet weak var labelSonuc: UILabel!
    @IBOutlet weak var labelYuzde: UILabel!
    
    var dogruSayisi:Int?
    var gelenAd:String=""
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "y.png")!)

        
        navigationItem.hidesBackButton = true
        
        if let d = dogruSayisi {
            labelSonuc.text = "\(d) DOĞRU   -  \(5-d) YANLIŞ"
            
            if d*100/5 == 100 {
                button.setTitle("GİRİŞ EKRANINA GERİ DÖN", for: .normal)
                labelYuzde.text = "TEBRİKLER \n \(gelenAd) \n %\(d*100/5) BAŞARI"
    
            }else if d*100/5 == 0 {
                labelYuzde.text = "MAALESEF \n \(gelenAd) \n %\(d*100/5) BAŞARI"
            }else{
                labelYuzde.text = "\(gelenAd) \n %\(d*100/5) BAŞARI"
            }
            
           
        }
    }
    
    
    @IBAction func tekrarDeneButton(_ sender: Any) {
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    
}
