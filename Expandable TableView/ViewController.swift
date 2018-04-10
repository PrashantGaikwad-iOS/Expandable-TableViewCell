//
//  ViewController.swift
//  Expandable TableView
//
//  Created by Prashant Gaikwad on 4/10/18.
//  Copyright © 2018 Left Right Mind. All rights reserved.
//

import UIKit

struct cellData {
  var opened = Bool()
  var title = String()
  var sectionData = [String]()
}

class ViewController: UITableViewController {

  var tableViewData = [cellData]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    tableViewData = [cellData(opened:false,title:"Title1",sectionData:["cell 1","cell 2","cell 3"]),
                    cellData(opened:false,title:"Title2",sectionData:["cell 1","cell 2","cell 3"]),
                    cellData(opened:false,title:"Title3",sectionData:["cell 1","cell 2","cell 3"]),
                    cellData(opened:false,title:"Title4",sectionData:["cell 1","cell 2","cell 3"])]
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func numberOfSections(in tableView: UITableView) -> Int {
    return tableViewData.count
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if tableViewData[section].opened == true {
        return tableViewData[section].sectionData.count + 1
    }
    else {
        return 1
    }
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 0 {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()}
      cell.textLabel?.text = tableViewData[indexPath.section].title
      cell.backgroundColor = .gray
      cell.tintColor = .white
      return cell
    }
    else{
      //Use different cell identifier if needed
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()}
      cell.textLabel?.text = tableViewData[indexPath.section].sectionData[indexPath.row - 1]
      return cell
    }
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    if indexPath.row == 0 {
      if tableViewData[indexPath.section].opened == true {
        tableViewData[indexPath.section].opened = false
        let sections = IndexSet.init(integer:indexPath.section)
        tableView.reloadSections(sections, with: .none)
      }
      else{
        tableViewData[indexPath.section].opened = true
        let sections = IndexSet.init(integer:indexPath.section)
        tableView.reloadSections(sections, with: .none)
      }
    }
    
    
  }
}

