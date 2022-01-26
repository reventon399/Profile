//
//  Presenter.swift
//  Profile
//
//  Created by Алексей Лосев on 26.01.2022.
//

import Foundation
import UIKit

protocol ProfilePresenterDelegate: AnyObject {
    func presentProfiles(results: [Profile])
    func presentAlerts(title: String, message: String)
}

typealias PresenterDelegate = ProfilePresenterDelegate & UIViewController

class UserPresenter {
    
    weak var delegate: PresenterDelegate?
    
    public func getProfiles() {
        let urlString = "https://randomuser.me/api/"
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else { return }
            
            do {
                let profiles = try JSONDecoder().decode([Profile].self, from: data)
                self?.delegate?.presentProfiles(results: profiles)
            }
            catch {
                print(error )
            }
        }
        task.resume()
    }
    
    public func setViewDelegate(delegate: PresenterDelegate) {
        self.delegate = delegate
    }
}
    
