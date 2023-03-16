//
//  ViewController.swift
//  BayrakTahminOyunu
//
//  Created by Alper Canımoğlu on 16.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var worldImage: UIImageView!
    @IBOutlet private weak var brazilImage: UIImageView!
    @IBOutlet private weak var mixedFlagsImage: UIImageView!
    @IBOutlet private weak var europeanImage: UIImageView!
    @IBOutlet private weak var irelanImage: UIImageView!
    @IBOutlet private weak var ukImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapToStartButton(_ sender: Any) {
        if let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController {
            navigationController?.pushViewController(secondVC, animated: true)
        }
        
    }
}

