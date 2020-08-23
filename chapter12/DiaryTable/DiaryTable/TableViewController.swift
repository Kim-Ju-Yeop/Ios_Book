//
//  TableViewController.swift
//  DiaryTable
//
//  Created by 김주엽 on 2020/08/23.
//  Copyright © 2020 Juyeop Kim. All rights reserved.
//

import UIKit

var items = [String]()
var itemsImage = [String]()

class TableViewController: UITableViewController {

    @IBOutlet var tvListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tvListView.reloadData()
    }
}

extension TableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        cell.textLabel?.text = items[(indexPath as NSIndexPath).row]
        cell.imageView?.image = UIImage(named: itemsImage[(indexPath as NSIndexPath).row])
        
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            items.remove(at: (indexPath as NSIndexPath).row)
            itemsImage.remove(at: (indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let itemToMove = items[(fromIndexPath as NSIndexPath).row]
        let itemImageToMove = itemsImage[(fromIndexPath as NSIndexPath).row]
        
        items.remove(at: (fromIndexPath as NSIndexPath).row)
        itemsImage.remove(at: (fromIndexPath as NSIndexPath).row)
        
        items.insert(itemToMove, at: (to as NSIndexPath).row)
        itemsImage.insert(itemImageToMove, at: (to as NSIndexPath).row)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "sgDetail") {
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            
            let detailView = segue.destination as! DetailViewController
            detailView.receiveItem(itemsImage[(indexPath! as NSIndexPath).row], items[(indexPath! as NSIndexPath).row])
        }
    }
}
