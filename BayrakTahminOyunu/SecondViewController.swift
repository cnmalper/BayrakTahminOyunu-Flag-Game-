//
//  SecondViewController.swift
//  BayrakTahminOyunu
//
//  Created by Alper Canımoğlu on 16.03.2023.
//

import UIKit

class SecondViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

   private let randomBayrakListesi = ["Brazil", "European Union", "France", "Germany", "Ireland", "Japan", "Turkey", "United Kingdom" ,"United States"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = flagCollectionView.dequeueReusableCell(withReuseIdentifier: "soruCollectionView", for: indexPath) as! SoruCollectionViewCell
        cell.bayrakSoruImage.image = UIImage(named: secilenBayrakListesi[indexPath.row])
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedFlag = secilenBayrakListesi[indexPath.row]
        if selectedFlag == secilenSoru {
            print("Dogru cevap!")
            secilenBayrakListesi = [String]()
            secilenSoru = ""
            self.soruLabel.text = ""
            bayrakSec()
            soruSec()
            collectionView.reloadData()
            puan += 1
            puanLabel.text = "Puan: \(puan)"
            soruNumber += 1
            soruSayisiLabel.text = "Soru: \(soruNumber)"
        }else{
            print("Hata!")
            decreaseDenemeHakki()
        }
    }
    
    @IBOutlet private weak var soruSayisiLabel: UILabel!
    @IBOutlet private weak var soruLabel: UILabel!
    @IBOutlet private weak var can1Image: UIImageView!
    @IBOutlet private weak var can2Image: UIImageView!
    @IBOutlet private weak var can3Image: UIImageView!
    @IBOutlet private weak var flagCollectionView: UICollectionView!
    @IBOutlet private weak var puanLabel: UILabel!
    
    private var secilenBayrakListesi = [String]()
    private var secilenElement : String = ""
    private var secilenSoru :  String = ""
    private var denemeHakki = 3
    private var puan = 0
    private var soruNumber = 1

    override func viewDidLoad() {
        super.viewDidLoad()

        self.can1Image.tintColor = UIColor.green
        self.can2Image.tintColor = UIColor.green
        self.can3Image.tintColor = UIColor.green
        self.puanLabel.text = "Puan: \(puan)"
        self.soruSayisiLabel.text = "Soru: \(soruNumber)"
        
        flagCollectionView.delegate = self
        flagCollectionView.dataSource = self
        bayrakSec()
        soruSec()
    }
    
    //MARK - RANDOM FLAG FUNCTION
    
    func bayrakSec(){
        while secilenBayrakListesi.count < 3 {
            secilenElement = randomBayrakListesi.randomElement()!
            if secilenBayrakListesi.contains(secilenElement){
                continue
            }else{
                secilenBayrakListesi.append(secilenElement)
            }
        }
        print(secilenBayrakListesi)
    }
    
    //MARK - RANDOM QUESTION FUNCTION
    
    func soruSec(){
        secilenSoru.append(secilenBayrakListesi.randomElement()!)
        self.soruLabel.text = "Asagidekilerden hangisi \(secilenSoru) bayragidir?"
    }
    
    //MARK - DENEME HAKKI FUNCTION
    
    func decreaseDenemeHakki(){
        denemeHakki -= 1
        if denemeHakki == 2 {
            can3Image.tintColor = UIColor.red
        } else if denemeHakki == 1 {
            can2Image.tintColor = UIColor.red
        } else if denemeHakki == 0 {
            can1Image.tintColor = UIColor.red
            if let thirdVC = storyboard?.instantiateViewController(withIdentifier: "thirdVC") as? ThirdViewController {
                navigationController?.pushViewController(thirdVC, animated: true)
            }
        }
    }
    
    //MARK - BUTTONS
    
    @IBAction func oyunuBitirButton(_ sender: Any) {
        if let thirdVC = storyboard?.instantiateViewController(withIdentifier: "thirdVC") as? ThirdViewController {
            navigationController?.pushViewController(thirdVC, animated: true)
            thirdVC.point = puan
        }
    }
    
    @IBAction func ogrenButton(_ sender: Any) {
        if let fourthVC = storyboard?.instantiateViewController(withIdentifier: "fourthVC") as? FourthViewController {
            navigationController?.pushViewController(fourthVC, animated: true)
        }
    }
    
    @IBAction func basaDonButton(_ sender: Any) {
        if let firstVC = storyboard?.instantiateViewController(withIdentifier: "firstVC") as? ViewController {
            navigationController?.pushViewController(firstVC, animated: true)
        }
    }
    
}
