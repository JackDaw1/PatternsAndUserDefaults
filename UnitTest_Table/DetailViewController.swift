//
//  DetailViewController.swift
//  TableView_v5
//
//  Created by Galina Iaroshenko on 05.12.2022.
//

import UIKit

class DetailViewController: UIViewController {
        
    var task:Task? {
            didSet {
                guard let taskItem = task else {return}
                if let price = taskItem.price {
                    priceDetailedLabel.text = "Price: \(price)"
                }
                if let numberOfSigns = taskItem.numberOfSigns {
                    numberOfSignsLabel.text = "Number of signs: \(numberOfSigns)"
                }
            }
        }
    

    let containerView:UIView = {
           let view = UIView()
           view.translatesAutoresizingMaskIntoConstraints = false
           view.clipsToBounds = true // this will make sure its children do not go out of the boundary
           return view
       }()
       
       
    
    let priceDetailedLabel:UILabel = {
        let label = UILabel()
        //self.translatesAutoresizingMaskIntoConstraints = false

        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let numberOfSignsLabel:UILabel = {
        let label = UILabel()
        //self.translatesAutoresizingMaskIntoConstraints = false

        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        containerView.addSubview(priceDetailedLabel)
        containerView.addSubview(numberOfSignsLabel)

        view.addSubview(containerView)

        containerView.heightAnchor.constraint(equalToConstant:400).isActive = true
        containerView.widthAnchor.constraint(equalToConstant:600).isActive = true
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        priceDetailedLabel.heightAnchor.constraint(equalToConstant:150).isActive = true
        priceDetailedLabel.widthAnchor.constraint(equalToConstant:190).isActive = true
        priceDetailedLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        //priceDetailedLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        priceDetailedLabel.translatesAutoresizingMaskIntoConstraints = false
            
        
        numberOfSignsLabel.heightAnchor.constraint(equalToConstant:190).isActive = true
        numberOfSignsLabel.widthAnchor.constraint(equalToConstant:400).isActive = true
        numberOfSignsLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        numberOfSignsLabel.topAnchor.constraint(equalTo:self.priceDetailedLabel.bottomAnchor).isActive = true
        numberOfSignsLabel.translatesAutoresizingMaskIntoConstraints = false
            
       
      
    }

}
