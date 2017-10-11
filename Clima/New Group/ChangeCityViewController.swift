//
//  ChangeCityViewController.swift
//  Clima
//
//  Created by Renan Avrahami on 10/8/17.
//  Copyright © 2017 Renan Avrahami. All rights reserved.
//

import UIKit

class ChangeCityViewController: UIViewController {

    @IBOutlet weak var changeCityTextField: UITextField!
    
    @IBAction func getWeatherPressed(_ sender: UIButton) {
        
    }
    
    
    @IBOutlet weak var testButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
