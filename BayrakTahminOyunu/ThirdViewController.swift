//
//  ThirdViewController.swift
//  BayrakTahminOyunu
//
//  Created by Alper Canımoğlu on 16.03.2023.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet private weak var bitisImage: UIImageView!
    @IBOutlet private weak var bitisLabel: UILabel!
    @IBOutlet private weak var puanBitisLabel: UILabel!
    
    var point = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.puanBitisLabel.text = "Puan: \(point)"

    }
    
    @IBAction func tekrarOynaButton(_ sender: Any) {
        if let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController {
            navigationController?.pushViewController(secondVC, animated: true)
        }
    }

}
