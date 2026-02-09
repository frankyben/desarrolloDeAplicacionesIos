//
//  ViewController.swift
//  ResumeeUIKit
//
//  Created by Alumno on 4/2/26.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var messageButon: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("View conroller code")
        name.text = "Carlos Islas"
    }
    
    @IBAction func modifyMessageButton(_ sender: UIButton) {
        print("Button tapped")
        messageButon.text = """
            - Computación avanzada en Java
            - Desarrollo de apps en IOS
            - Desarrollo de apps en Android
            """
    }
    

}

