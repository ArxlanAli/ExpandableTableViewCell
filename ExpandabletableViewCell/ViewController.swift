//
//  ViewController.swift
//  ExpandabletableViewCell
//
//  Created by Arslan Ali on 3/8/18.
//  Copyright © 2018 Arslan Ali. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var array = [TableData]()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        array = [TableData(opended: false, title: "title1", sectionData: ["hello1","hello1","hello1","hello1","hello1"]),TableData(opended: false, title: "title2", sectionData: ["hello2","hello2","hello2","hello2","hello2"]),TableData(opended: false, title: "title3", sectionData: ["hello3","hello3","hello3","hello3","hello3"]),TableData(opended: false, title: "title4", sectionData: ["hello4","hello4","hello4","hello4","hello4"])]
        
        for arr in array{
            print(arr.title)
        }
        self.tableView.backgroundColor = .white
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "id")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.array[section].opended == false{
            return 1
        }else{
            return self.array[section].sectionData.count + 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath) as UITableViewCell
        if indexPath.row == 0{
            print(self.array[indexPath.section].title)
            cell.textLabel?.text = self.array[indexPath.section].title
        }else{
            cell.textLabel?.text = self.array[indexPath.section].sectionData[indexPath.row - 1]
        }
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            if self.array[indexPath.section].opended == false{
                
                self.array[indexPath.section].opended = true
                let section = IndexSet(integer: indexPath.section)
                tableView.reloadSections(section, with: .none)
            }else{
                self.array[indexPath.section].opended = false
                let section = IndexSet(integer: indexPath.section)
                tableView.reloadSections(section, with: .none)
            }
        }
       
    }

}


struct TableData{
    var opended = Bool()
    var title = String()
    var sectionData = [String]()
}

