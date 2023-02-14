//
//  MovieCardCollectionViewCell.swift
//  ReflexionAI Assignment
//
//  Created by Mekala Vamsi Krishna on 11/02/23.
//

import UIKit
import SDWebImage

class MovieCardCollectionViewCell: UICollectionViewCell {
    static let identifier = "MovieCardCollectionViewCell"
    
    let cardView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .left
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let yearLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .left
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let runtimeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .ultraLight)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let castLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .left
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(cardView)
        cardView.addSubview(posterImageView)
        cardView.addSubview(titleLabel)
        cardView.addSubview(yearLabel)
        cardView.addSubview(runtimeLabel)
        cardView.addSubview(castLabel)
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    private func applyConstraints() {
        
        let cardViewConstraints = [
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            cardView.heightAnchor.constraint(equalToConstant: 300)
        ]
        
        let posterImageViewConstraints = [
            posterImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            posterImageView.topAnchor.constraint(equalTo: cardView.topAnchor),
            posterImageView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -110),
        ]
        
        let titleConstraints = [
            titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ]

        let yearConstraints = [
            yearLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            yearLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            yearLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ]

        let runtimeConstraints = [
            runtimeLabel.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 5),
            runtimeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            runtimeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ]

        let castConstraints = [
            castLabel.topAnchor.constraint(equalTo: runtimeLabel.bottomAnchor, constant: 5),
            castLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            castLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            castLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -10)
        ]
        
        NSLayoutConstraint.activate(cardViewConstraints)
        NSLayoutConstraint.activate(posterImageViewConstraints)
        NSLayoutConstraint.activate(titleConstraints)
        NSLayoutConstraint.activate(yearConstraints)
        NSLayoutConstraint.activate(runtimeConstraints)
        NSLayoutConstraint.activate(castConstraints)
    }
    
}
