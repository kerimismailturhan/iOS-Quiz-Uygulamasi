//
//  ViewController.swift
//  Bayrak Uygulaması
//
//  Created by KERİM İSMAİL TURHAN on 15.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldAd: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "a.png")!)
       
        veriTabaniKopyala()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textFieldAd.text = ""
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let GidilecekVC = segue.destination as! QuizEkraniViewController
        GidilecekVC.gelenAd = textFieldAd.text!
    }
    
    @IBAction func startQuizTiklandi(_ sender: Any) {
        if textFieldAd.text == "" {
            let alert = UIAlertController(title: "UYARI", message: "Lütfen Kullanıcı Adı Giriniz!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "TAMAM", style: .cancel, handler: nil))
            present(alert,animated: true)
        } else {
        performSegue(withIdentifier: "toAnaEkran", sender: nil)
        }
    }
    
   
    
    func veriTabaniKopyala(){
        
        let bundleYolu = Bundle.main.path(forResource: "bayrakquiz", ofType: ".sqlite")
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let fileManager = FileManager.default
        
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("bayrakquiz.sqlite")
        
        if fileManager.fileExists(atPath: kopyalanacakYer.path) {
            print("VeriTabanı Zaten var Kopyalamaya gerek yok")
            
        }else{
            do {
                
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
                
            }catch {
                print(error)
            }
        }
    }

}

