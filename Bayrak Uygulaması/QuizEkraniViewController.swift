//
//  QuizEkraniViewController.swift
//  Bayrak Uygulaması
//
//  Created by KERİM İSMAİL TURHAN on 15.12.2021.
//

import UIKit

class QuizEkraniViewController: UIViewController {

   
    @IBOutlet weak var labelDogru: UILabel!
    @IBOutlet weak var labelYanlis: UILabel!
    @IBOutlet weak var labelSoruSayisi: UILabel!
    @IBOutlet weak var imageViewBayrak: UIImageView!
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    
    var gelenAd : String = ""
    
    var sorular = [Bayraklar]()
    var yanlisSecenekler = [Bayraklar]()
    
    var dogruSoru = Bayraklar()
    
    var soruSayac = 0
    var dogruSayac = 0
    var yanlisSayac = 0
    
    var secenekler = [Bayraklar]()
    var seceneklerKaristirmaListesi = Set <Bayraklar>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sorular = Bayraklardao().rasgele5Getir()
        
        for s in sorular {
            print(s.bayrak_ad!)
        }
        
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "y.png")!)
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "\(gelenAd)"
       
        
        soruYukle()
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let gidilecekVC = segue.destination as! sonucEkraniViewController
        gidilecekVC.dogruSayisi = dogruSayac
        gidilecekVC.gelenAd = gelenAd
        
    }
    
    func soruYukle() {
        labelSoruSayisi.text = "\(soruSayac+1). SORU"
        labelDogru.text = "DOĞRU : \(dogruSayac)"
        labelYanlis.text = "YANLIŞ : \(yanlisSayac)"
        
        dogruSoru = sorular[soruSayac]
        imageViewBayrak.image = UIImage(named: dogruSoru.bayrak_resim!)
        
        yanlisSecenekler = Bayraklardao().rasgele3YanlisSecenekGetir(bayrak_id: dogruSoru.bayrak_id!)
        
        seceneklerKaristirmaListesi.removeAll()
        
        seceneklerKaristirmaListesi.insert(dogruSoru)
        seceneklerKaristirmaListesi.insert(yanlisSecenekler[0])
        seceneklerKaristirmaListesi.insert(yanlisSecenekler[1])
        seceneklerKaristirmaListesi.insert(yanlisSecenekler[2])
        
        secenekler.removeAll()
        
        for s in seceneklerKaristirmaListesi {
            secenekler.append(s)
        }
        
        buttonA.setTitle(secenekler[0].bayrak_ad, for: .normal)
        buttonB.setTitle(secenekler[1].bayrak_ad, for: .normal)
        buttonC.setTitle(secenekler[2].bayrak_ad, for: .normal)
        buttonD.setTitle(secenekler[3].bayrak_ad, for: .normal)
        
        
    }
    
    func dogruKontrol(button:UIButton){
        
        let buttonYazi = button.titleLabel?.text
        let dogruCevap = dogruSoru.bayrak_ad
        
        print("Button Yazi : \(buttonYazi!)")
        print("Doğru Cevap : \(dogruCevap!)")
        
        if dogruCevap == buttonYazi {
            button.isEnabled = false
            buttonA.isEnabled = false
            buttonB.isEnabled = false
            buttonC.isEnabled = false
            buttonD.isEnabled = false
            button.backgroundColor = UIColor.green
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // Change `1.0` to the desired number of seconds.
                button.backgroundColor = UIColor.white
                self.buttonA.isEnabled = true
                self.buttonB.isEnabled = true
                self.buttonC.isEnabled = true
                self.buttonD.isEnabled = true
                button.isEnabled = true
            }
           
            dogruSayac+=1
        
            
            if soruSayac+1 == 1 {
                label1.backgroundColor = UIColor.green
                label1.text = "1"
            }
            if soruSayac+1 == 2 {
                label2.backgroundColor = UIColor.green
                label2.text = "2"
            }
            if soruSayac+1 == 3 {
                label3.backgroundColor = UIColor.green
                label3.text = "3"
            }
            if soruSayac+1 == 4 {
                label4.backgroundColor = UIColor.green
                label4.text = "4"
            }
            if soruSayac+1 == 5 {
                label5.backgroundColor = UIColor.green
                label5.text = "5"
                
            }

        }else{
            button.isEnabled = false
            buttonA.isEnabled = false
            buttonB.isEnabled = false
            buttonC.isEnabled = false
            buttonD.isEnabled = false
            button.backgroundColor = UIColor.red
            if dogruCevap == buttonA.titleLabel?.text {
                buttonA.backgroundColor =  UIColor.green
                button.isEnabled = false
            }
            if dogruCevap == buttonB.titleLabel?.text {
                buttonB.backgroundColor =  UIColor.green
                button.isEnabled = false
            }
            if dogruCevap == buttonC.titleLabel?.text {
                buttonC.backgroundColor =  UIColor.green
                button.isEnabled = false
            }
            if dogruCevap == buttonD.titleLabel?.text {
                buttonD.backgroundColor =  UIColor.green
                button.isEnabled = false
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // Change `2.0` to the desired number of seconds.
                button.backgroundColor = UIColor.white
                self.buttonA.backgroundColor =  UIColor.white
                self.buttonB.backgroundColor =  UIColor.white
                self.buttonC.backgroundColor =  UIColor.white
                self.buttonD.backgroundColor =  UIColor.white
                self.buttonA.isEnabled = true
                self.buttonB.isEnabled = true
                self.buttonC.isEnabled = true
                self.buttonD.isEnabled = true
                button.isEnabled = true
            }
            yanlisSayac+=1
            
            
            if soruSayac+1 == 1 {
                label1.backgroundColor = UIColor.red
                label1.text = "1"
            }
            if soruSayac+1 == 2 {
                label2.backgroundColor = UIColor.red
                label2.text = "2"
            }
            if soruSayac+1 == 3 {
                label3.backgroundColor = UIColor.red
                label3.text = "3"
            }
            if soruSayac+1 == 4 {
                label4.backgroundColor = UIColor.red
                label4.text = "4"
            }
            if soruSayac+1 == 5 {
                label5.backgroundColor = UIColor.red
                label5.text = "5"
                
            }
        }
        
        labelDogru.text = "DOĞRU : \(dogruSayac)"
        labelYanlis.text = "YANLIŞ : \(yanlisSayac)"
        
        
    }
    
    func soruSayacKontrol(){
        soruSayac += 1
        
        if soruSayac != 5 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // Change `2.0` to the desired number of seconds.
                self.soruYukle()
            }
          
        }else{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // Change `2.0` to the desired number of seconds.
               // Code you want to be delayed
                self.performSegue(withIdentifier: "toSonucEkrani", sender: nil)
            }
           
        }
        
    }
    
    @IBAction func buttonATikla(_ sender: Any) {
        dogruKontrol(button: buttonA)
        soruSayacKontrol()
    }
    
    @IBAction func buttonBTikla(_ sender: Any) {
        dogruKontrol(button: buttonB)
        soruSayacKontrol()
    }
    
    @IBAction func buttonCTikla(_ sender: Any) {
        dogruKontrol(button: buttonC)
        soruSayacKontrol()
    }
    @IBAction func buttonDTikla(_ sender: Any) {
        dogruKontrol(button: buttonD)
        soruSayacKontrol()
    }
    
    
}
