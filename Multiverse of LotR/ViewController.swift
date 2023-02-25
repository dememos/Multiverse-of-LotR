//
//  ViewController.swift
//  Multiverse of LotR
//
//  Created by Irina Kochenova on 14.02.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var allCharacters: [Character] = []
    
    var tableView: UITableView = {
        var table = UITableView()
        table.backgroundColor = .systemBlue
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        createCharacterArray()
   
        
        tableView.register(CharacterCell.self, forCellReuseIdentifier: "CellIdentifier")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 100
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        tableView.separatorColor = .systemGray2
        
        
        view.addSubview(tableView)
        view.safeAreaLayoutGuide.owningView?.backgroundColor = .systemGray2
        
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(60)//100
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview().inset(10)
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func createCharacterArray() {
        
        allCharacters.append(Character(name: "Фродо", image: UIImage(named: "picture")!, description: "some info"))
        allCharacters.append(Character(name: "Сэмуайз", image: UIImage(named: "picture")!, description: "some info"))
        allCharacters.append(Character(name: "Галадриэль", image: UIImage(named: "picture")!, description: "some info"))
        allCharacters.append(Character(name: "Гэндальф", image: UIImage(named: "picture")!, description: "some info"))
        
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCharacters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterCell.reuseIdentifier, for: indexPath) as! CharacterCell
        let character = allCharacters[indexPath.row]
        
        cell.character = character
        return cell
    }
    
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let datailViewController = DetailController(character: allCharacters[indexPath.row])
        
        present(datailViewController, animated: true)
    }
}

