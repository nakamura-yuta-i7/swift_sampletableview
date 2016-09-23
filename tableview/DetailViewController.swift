//
//  DetailViewController.swift
//  tableview
//
//  Created by 中村祐太 on 2016/09/23.
//  Copyright © 2016年 中村祐太. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var user:User? = nil
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userName.text = user?.name
        userEmail.text = user?.email
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
