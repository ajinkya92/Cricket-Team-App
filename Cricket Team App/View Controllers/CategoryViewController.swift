//
//  CategoryViewController.swift
//  Cricket Team App
//
//  Created by Ajinkya Sonar on 09/09/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var categoryArray = [Category]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        getData()
    }
    
    @IBAction func addCategoryBtnTapped(_ sender: UIBarButtonItem) {
        
        let addCategoryVC = storyboard?.instantiateViewController(withIdentifier: "AddCategoryViewController") as! AddCategoryViewController
        
        navigationController?.pushViewController(addCategoryVC, animated: true)
        
        
    }
    

}

// MARK: TableView Implementation

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categoryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as! CategoryCell
        
        let category = categoryArray[indexPath.row]
        
        if let image = category.teamLogo as Data? {
            
            cell.categoryTeamLogo.image = UIImage(data: image)
        }
        
        cell.categoryTeamNameLbl.text = category.teamName
        
        return cell
    }
    
}

// MARK: Core Data Methods

extension CategoryViewController {
    
    func getData() {
        
        do{
            
            categoryArray = try context.fetch(Category.fetchRequest())
        } catch{
            
            print(error.localizedDescription)
        }
        
        tableView.reloadData()
        
    }
    
}











