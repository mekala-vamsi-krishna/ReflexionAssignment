//
//  ViewController.swift
//  ReflexionAI Assignment
//
//  Created by Mekala Vamsi Krishna on 11/02/23.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    var movies = List<MovieList>()
    var realm = try! Realm()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        collectionView.register(MovieCardCollectionViewCell.self, forCellWithReuseIdentifier: MovieCardCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        getData()
    }
    
    func getData() {
        
        if realm.objects(MovieList.self).count != 0 {
            
            movies.removeAll()
            let data = realm.objects(MovieList.self)
            movies.append(objectsIn: data)
            collectionView.reloadData()
        } else {
            
            let url = URL(string: "https://task.auditflo.in/1.json")!

            URLSession.shared.dataTask(with: url) { [self] (data, response, error) in
                if let data = data {
                    do {
                        
                        let decoder = JSONDecoder()
                        let jsonMovies = try decoder.decode(Movies.self, from: data)
                            DispatchQueue.main.async {
                                try? self.realm.write({
                                    self.movies = jsonMovies.movieList
                                    self.realm.add(self.movies)
                                    self.collectionView.reloadData()
                                })
                            }
                        print(movies)
                    } catch {
                        
                        print(error)
                    }
                }
            }.resume()
        }
    
    }
    
    private func setupViews() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCardCollectionViewCell.identifier, for: indexPath) as! MovieCardCollectionViewCell
        let movie = movies[indexPath.item]
        let imageURL = URL(string: movie.moviePoster!)
        
        URLSession.shared.dataTask(with: imageURL!) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    cell.posterImageView.image = UIImage(data: data)
                }
            }
        }.resume()
        
        cell.titleLabel.text = movie.title
        cell.yearLabel.text = movie.year
        cell.runtimeLabel.text = movie.runtime
        cell.castLabel.text = movie.cast
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
}
