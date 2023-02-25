//
//  CharacterCell.swift
//  Multiverse of LotR
//
//  Created by Irina Kochenova on 14.02.2023.
//

import UIKit
import SnapKit

class CharacterCell: UITableViewCell {
    
    static let reuseIdentifier = "CellIdentifier"
    
    var character: Character? {
        didSet {
            characterImage.image = character?.image
            characterNameLabel.text = character?.name
            charactertDescriptionLabel.text = character?.description
        }
    }
    
    
    private let characterNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 17)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let charactertDescriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .systemGray
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let characterImage: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "picture"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = false
        imgView.layer.shadowColor = UIColor.gray.cgColor
        imgView.layer.shadowOpacity = 0.5
        imgView.layer.shadowOffset = CGSize.zero
        imgView.layer.shadowRadius = 5
        return imgView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .white
        selectionStyle = .none
        
        
        
        addSubview(characterImage)
        addSubview(characterNameLabel)
        addSubview(charactertDescriptionLabel)

 
        characterImage.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(10)
            make.width.equalTo(80)
            make.top.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
        }
        
        characterNameLabel.snp.makeConstraints { make in
            make.topMargin.equalToSuperview().inset(10)
            make.left.equalTo(characterImage.snp_rightMargin).offset(15)
        }
        
        charactertDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(characterNameLabel).inset(25)
            make.left.equalTo(characterImage.snp_rightMargin).offset(15)
        }
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            backgroundColor = UIColor.systemMint
        } else {
            backgroundColor = UIColor.white
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
}
