//
//  InfoHeroVC.swift
//  LearnCode
//
//  Created by Trần Trọng on 10/11/20.
//  Copyright © 2020 Trần Trọng. All rights reserved.
//

import UIKit

class InfoHeroVC: UIViewController {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAttack: UILabel!
    @IBOutlet weak var lblMana: UILabel!
    @IBOutlet weak var lblArmor: UILabel!
    @IBOutlet weak var lblRange: UILabel!
    @IBOutlet weak var lblSpeed: UILabel!
    @IBOutlet weak var lblRoles: UILabel!
    @IBOutlet weak var lblEnabled: UILabel!
    @IBOutlet weak var lblAgi: UILabel!
    
    @IBOutlet weak var imgHero: UIImageView!
    
    var name = ""
    var attack: Double = 0.0
    var mana: Int = 0
    var armor: Double = 0.0
    var range: Int = 0
    var speed: Int = 0
    var enabled: Bool = false
    var reles: Int = 0
    var agi: Int = 0
    var img = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblName.text = name
        lblAttack.text  = "Attack: \(String(attack))"
        lblMana.text = "Mana: \(String(mana))"
        lblArmor.text = "Armor: \(String(armor))"
        lblRange.text = "Range: \(String(range))"
        lblSpeed.text = "Speed: \(String(speed))"
        lblRoles.text = "Roles: \(String(reles))"
        lblAgi.text = "Age: \(String(agi))"
        lblEnabled.text = "Enabled: \(String(enabled))"
        
        imgHero.downloaded(from: img, contentMode: .scaleAspectFill)

    }
    
    @IBAction func handleBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
   
}
