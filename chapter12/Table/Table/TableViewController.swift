//
//  TableViewController.swift
//  Table
//
//  Created by 김주엽 on 2020/08/22.
//  Copyright © 2020 Juyeop Kim. All rights reserved.
//

import UIKit

var items = ["책 구매", "철수와 약속", "스티커 준비하기"]
var itemsImage = ["cart.png", "clock.png", "pencil.png"]

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
    
    // 테이블 섹션 개수 지정
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // 테이블 셀 개수 지정
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // 테이블 셀에 대한 속성 지정
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = items[(indexPath as NSIndexPath).row]
        cell.imageView?.image = UIImage(named: itemsImage[(indexPath as NSIndexPath).row])
        
        return cell
    }
    
    // 테이블 셀 삭제
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            items.remove(at: (indexPath as NSIndexPath).row)
            itemsImage.remove(at: (indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // 테이블 셀 삭제 텍스트 변경
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    
    // 테이블 셀 순서 목록 변경
    override func tableView(_ tableView: UITableView, moveRowAt fromeIndexPath: IndexPath, to: IndexPath) {
        let itemToMove = items[(fromeIndexPath as NSIndexPath).row]
        let itemImageToMove = itemsImage[(fromeIndexPath as NSIndexPath).row]
        
        items.remove(at: (fromeIndexPath as NSIndexPath).row)
        itemsImage.remove(at: (fromeIndexPath as NSIndexPath).row)
        
        items.insert(itemToMove, at: (to as NSIndexPath).row)
        itemsImage.insert(itemImageToMove, at: (to as NSIndexPath).row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "sgDetail") {
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            
            let detailView = segue.destination as! DetailViewController
            detailView.receiveItem(items[((indexPath! as NSIndexPath).row)])
        }
    }
}
