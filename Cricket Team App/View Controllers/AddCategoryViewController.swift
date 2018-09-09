//
//  AddCategoryViewController.swift
//  Cricket Team App
//
//  Created by Ajinkya Sonar on 10/09/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import UIKit
import CoreData

class AddCategoryViewController: UIViewController {
    
    @IBOutlet weak var teamLogoImg: UIImageView!
    @IBOutlet weak var teamNameTxt: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func addLogoBtnTapped(_ sender: UIButton) {
        
        let picker = UIImagePickerController()
        
        picker.delegate = self
        
        picker.sourceType = .photoLibrary
        
        self.present(picker, animated: true, completion: nil)
        
    }
    
    @IBAction func saveTeamBtnTapped(_ sender: UIButton) {
        
        let newTeam = Category(context: context)
        newTeam.teamName = teamNameTxt.text
        newTeam.teamLogo = UIImagePNGRepresentation(teamLogoImg.image!)
        
        do{
            
            try context.save()
        } catch{
            
            print(error.localizedDescription)
        }
        
        teamNameTxt.text = ""
        teamLogoImg.image = nil
        
        navigationController?.popViewController(animated: true)
        
    }
    

}

// MARK: Image Picker Functionality

extension AddCategoryViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let teamImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            teamLogoImg.image = teamImage
            
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
}






