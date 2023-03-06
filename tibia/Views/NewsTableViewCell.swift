//
//  NewsTableViewCell.swift
//  tibia
//
//  Created by allexis figueiredo on 05/03/23.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    let label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 15)
        
        return label
    }()
    
    let disclosureIndicator: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        label.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.addSubview(label)
        
        backgroundColor = .secondarySystemBackground
        accessoryType = .disclosureIndicator
        
        label.frame = .init(x: 60,
                            y: contentView.height / 4,
                            width: contentView.width - 50,
                            height: contentView.height / 2)
    }
    
    func configUI(with model: NewsTableViewCellViewModel) {
        label.text = model.news
        
        switch model.category {
        case "community":
            self.imageView?.image = UIImage(systemName: "person.2",
                                            withConfiguration: UIImage.SymbolConfiguration(pointSize: 14, weight: .regular))
        case "development":
            self.imageView?.image = UIImage(systemName: "gear",
                                            withConfiguration: UIImage.SymbolConfiguration(pointSize: 14, weight: .regular))
        default:
            self.imageView?.image = UIImage(systemName: "newspaper",
                                            withConfiguration: UIImage.SymbolConfiguration(pointSize: 14, weight: .regular))
        }
    }
}
