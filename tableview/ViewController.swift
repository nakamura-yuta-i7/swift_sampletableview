//
//  ViewController.swift
//  tableview
//
//  Created by 中村祐太 on 2016/09/23.
//  Copyright © 2016年 中村祐太. All rights reserved.
//

import UIKit

class User: AnyObject {
    var name:String
    var email:String
    init(name:String, email:String) {
        self.name = name
        self.email = email
    }
}

class ViewController: UIViewController {

    @IBAction func backHome(segue: UIStoryboardSegue) {}
    
    var list:[User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        list.append(User(name:"Yuta", email:"yuta.nakamura.i7@gmail.com"))
        list.append(User(name:"Pico", email:"picopico-pi-chan@gmail.com"))
        list.append(User(name:"Puu", email:"puu-chan@gmail.com"))
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        let user:User = list[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.email
        return cell
    }
    
    func tableView(_ table: UITableView, didSelectRowAt indexPath:IndexPath) {
        let user = list[indexPath.row]
        print("user: ", user)
        performSegue(withIdentifier: "gotoDetailSegue", sender: user)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        print("segue.destination: ", segue.destination)
        
        if segue.identifier == "gotoDetailSegue" {
            let detailVC = segue.destination as! DetailViewController
            print("detailVC", detailVC)
            print("sender: ", sender)
            let user = sender as! User
            detailVC.user = user
        }
    }
}
