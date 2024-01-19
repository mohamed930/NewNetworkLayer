//
//  RecipesCell.swift
//  testConnection
//
//  Created by Mohamed Ali on 19/01/2024.
//

import UIKit

class RecipesCell: UICollectionViewCell {
    
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeWriterLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func configureCell(_ model: RecipeModel) {
        rateLabel.text         = "\(model.yield)"
        recipeTitleLabel.text  = model.label
        recipeWriterLabel.text = "By \(model.source)"
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            self.recipeImageView.loadImageFromServer(model.images.regular.url)
        }
    }

}
