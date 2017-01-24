//
//  StarWarsUniverseTableViewController.swift
//  StarWars
//
//  Created by Eric Risco de la Torre on 23/01/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import UIKit

class StarWarsUniverseTableViewController: UITableViewController {
    
    let model: StarWarsUniverse
    
    init(model: StarWarsUniverse){
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return model.affiliationCount
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.characterCount(forAffiliation: getAffiliation(forSection: section))
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return model.affiliationName(getAffiliation(forSection: section))
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cellId = "StarWarsCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        
        let affiliation  = getAffiliation(forSection: indexPath.section)
        
        do{
            let char = try model.character(atIndex: indexPath.row, forAffiliation: affiliation)
            
            if cell == nil{
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
            }
            
            cell?.imageView?.image = char?.photo
            cell?.textLabel?.text = char?.alias
            
            cell?.detailTextLabel?.text = char?.name
            
            if char?.midichlorians != 0{
                let midString = "\((char?.midichlorians)!)"
                
                if let name = char?.name{
                    cell?.detailTextLabel?.text = "\(name) - Midichlorians: \(midString)"
                }else{
                    cell?.detailTextLabel?.text = "Midichlorians: \(midString)"
                }
                
                if(char?.affiliation == .galacticEmpire){
                    cell?.backgroundColor = UIColor.red
                }
                if(char?.affiliation == .rebelAlliance){
                    cell?.backgroundColor = UIColor.yellow
                }
                if(char?.affiliation == .firstOrder){
                    cell?.backgroundColor = UIColor.purple
                }
                
            }
            
            
        }catch{
            fatalError("ERROR FATAL")
        }
        
        return cell!
        
    }
    
    func getAffiliation(forSection section: Int) -> StarWarsAffiliation {
        
        var aff: StarWarsAffiliation = .unknown
        switch section {
        case 0:
            aff = .galacticEmpire
        case 1:
            aff = .rebelAlliance
        case 2:
            aff = .firstOrder
        case 3:
            aff = .hutt
        default:
            aff = .unknown
        }
        
        return aff
        
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
