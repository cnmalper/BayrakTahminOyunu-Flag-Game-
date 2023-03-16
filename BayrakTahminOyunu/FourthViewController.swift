//
//  FourthViewController.swift
//  BayrakTahminOyunu
//
//  Created by Alper Canımoğlu on 16.03.2023.
//

import UIKit

class FourthViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bayrakListesi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ulkelerCollectionView.dequeueReusableCell(withReuseIdentifier: "bilgiCollectionView", for: indexPath) as! BilgiCollectionViewCell
        cell.bayrakBilgiImage.image = UIImage(named: bayrakListesi[indexPath.row])
        cell.bayrakBilgiLabel.text = bayrakListesi[indexPath.row]
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    private let bayrakListesi = ["Brazil", "European Union", "France", "Germany", "Ireland", "Japan", "Turkey", "United Kingdom" ,"United States"]
    
    @IBOutlet weak var ulkelerCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ulkelerCollectionView.delegate = self
        ulkelerCollectionView.dataSource = self
    }
    
    @IBAction func oyunuBitirButton(_ sender: Any) {
        if let firstVC = storyboard?.instantiateViewController(withIdentifier: "firstVC") as? ViewController {
            navigationController?.pushViewController(firstVC, animated: true)
        }
    }
    
}
