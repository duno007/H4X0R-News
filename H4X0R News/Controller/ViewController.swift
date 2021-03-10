//
//  ViewController.swift
//  H4X0R News
//
//  Created by DOUG UNO on 3/3/21.
//

import UIKit
import WebKit

protocol ViewControllerDelegate: class {
    func didFinishUpdates()
}

class ViewController: UIViewController, ViewControllerDelegate, UITableViewDelegate {
    func didFinishUpdates() {
        tableView.reloadData()
    }
    
    
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var tableView: UITableView!
    
    var networkManager = NetworkManager()
    
    override func viewDidLoad() {
        self.navigationItem.title = "H4X0R News"
        self.networkManager.fetchData()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        networkManager.delegate = self
        super.viewDidLoad()
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return networkManager.posts.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = networkManager.posts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
        cell.textLabel?.text = "\(post.points)   \(post.title)"
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell number: \(indexPath.row)!")
        performSegue(withIdentifier: "showLink", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showLink" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destination = segue.destination as? WebViewController
                destination?.links = networkManager.posts[indexPath.row].url ?? "https://www.google.com"
            }
        }
    }
    
}

