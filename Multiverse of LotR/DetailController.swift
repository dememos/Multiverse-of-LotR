//
//  DetailController.swift
//  Multiverse of LotR
//
//  Created by Irina Kochenova on 15.02.2023.
//

import UIKit
import SnapKit

class DetailController: UIViewController {
    
    var character: Character
    

    init(character: Character){
        self.character = character
        super.init(nibName: nil, bundle: nil)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemMint

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
