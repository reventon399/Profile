//
//  ProfileViewController.swift
//  Profile
//
//  Created by Алексей Лосев on 26.01.2022.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ProfilePresenterDelegate {
    
    
   
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
   
    let firstNameLabel = UILabel()
    let ageLabel = UILabel()
    let countryLabel = UILabel()
    let cityLabel = UILabel()
    let genderLabel = UILabel()
    
    let firstNameTextField = UITextField()
    let ageTextField = UITextField()
    let countryTextField = UITextField()
    let cityTextField = UITextField()
    let genderTextField = UITextField()
    
    let fullImageView = AddProfilePhotoView()
    
    private var profiles = [Profile]()
    
    private let presenter = UserPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //table
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        //presenter
        presenter.setViewDelegate(delegate: self)
        presenter.getProfiles()

        setupContraints ()
        
        firstNameLabel.text = "Name:"
        ageLabel.text = "Age:"
        countryLabel.text = "Country:"
        cityLabel.text = "City:"
        genderLabel.text = "Gender:"
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    // table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = profiles[indexPath.row].results.first?.name.first
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // presenter delegate
    func presentProfiles(results: [Profile]) {
        self.profiles = results
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    func presentAlerts(title: String, message: String) {
        
    }
    
}
// MARK: - Setup contraints
extension ProfileViewController {
    private func setupContraints () {
        
        let nameStackView = UIStackView(arrangedSubviews: [firstNameLabel, firstNameTextField])
        nameStackView.axis = .horizontal
        nameStackView.spacing = 0
        
        let ageStackView = UIStackView(arrangedSubviews: [ageLabel, ageTextField])
        ageStackView.axis = .horizontal
        ageStackView.spacing = 0
        
        let countryStackView = UIStackView(arrangedSubviews: [countryLabel, countryTextField])
        countryStackView.axis = .horizontal
        countryStackView.spacing = 0
        
        let cityStackView = UIStackView(arrangedSubviews: [cityLabel, cityTextField])
        cityStackView.axis = .horizontal
        cityStackView.spacing = 0
        
        let genderStackView = UIStackView(arrangedSubviews: [genderLabel, genderTextField])
        genderStackView.axis = .horizontal
        genderStackView.spacing = 0
        
        let nameAndAgeStackView = UIStackView(arrangedSubviews: [nameStackView, ageStackView])
        nameAndAgeStackView.axis = .vertical
        nameAndAgeStackView.spacing = -1
        
        let contryCityGenderStackView = UIStackView(arrangedSubviews: [countryStackView, cityStackView, genderStackView])
        contryCityGenderStackView.axis = .vertical
        contryCityGenderStackView.spacing = 10
        
        fullImageView.translatesAutoresizingMaskIntoConstraints = false
        nameAndAgeStackView.translatesAutoresizingMaskIntoConstraints = false
        contryCityGenderStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(fullImageView)
        view.addSubview(nameAndAgeStackView)
        view.addSubview(contryCityGenderStackView)
        
        
        
        view.addSubview(fullImageView)
        
        NSLayoutConstraint.activate([
            fullImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            fullImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nameAndAgeStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            nameAndAgeStackView.trailingAnchor.constraint(equalTo: fullImageView.trailingAnchor, constant: 60),
        ])
        
        NSLayoutConstraint.activate([
            contryCityGenderStackView.topAnchor.constraint(equalTo: fullImageView.bottomAnchor, constant: 40),
            contryCityGenderStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            contryCityGenderStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
    
}
