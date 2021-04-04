//
//  OnboardingViewController.swift
//  JoodTAG
//
//  Created by aymane hachcham on 4/4/2021.
//

import Foundation
import UIKit

class DisplayabaleViewController: UIViewController {
    
    let screenSize = UIScreen.main.bounds
    var viewIcon: UIImageView?
    var viewTitle: UILabel?
    
    lazy var displayableUIStackView: UIStackView = {
      
        var stackLayout = UIStackView(frame: view.bounds)
        stackLayout.translatesAutoresizingMaskIntoConstraints = false
        stackLayout.distribution = UIStackView.Distribution.equalSpacing
        stackLayout.spacing = 30
        stackLayout.axis = .vertical
        
        viewIcon = UIImageView()
        viewIcon!.heightAnchor.constraint(equalToConstant: screenSize.height/3).isActive = true
        viewIcon!.widthAnchor.constraint(equalToConstant: screenSize.width/2).isActive = true
        
        viewTitle = UILabel()
        viewTitle!.widthAnchor.constraint(equalToConstant: screenSize.width/2).isActive = true
        
        stackLayout.addArrangedSubview(viewIcon!)
        stackLayout.addArrangedSubview(viewTitle!)
        
        stackLayout.autoresizingMask = [.flexibleWidth, .flexibleWidth]
        
        return stackLayout
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(displayableUIStackView)
//        setUpdDisplayableController()
    }
    
    override func viewDidLayoutSubviews() {
        displayableUIStackView.center = view.center
    }
    
    private func setUpdDisplayableController(){
        
        NSLayoutConstraint.activate([
            
            displayableUIStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            displayableUIStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            displayableUIStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
        ])
    }
}

class OnboardingViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    let colors: [UIColor] = [
        .red,
        .blue,
        .gray
    ]
    
    let titles: [String] = [
        
        "Title PageViewController 1",
        "Title PageViewController 2",
        "Title PageViewController 3",
    ]
    
    let icons: [String] = [
        
        "dish",
        "help",
        "support"
    ]
    
    var pages: [UIViewController] = [UIViewController]()
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = nil
        
        view.backgroundColor = .white
        
        
        for count in 0..<colors.count {
            let displayController = DisplayabaleViewController()
            displayController.view.backgroundColor = colors[count]
            
            displayController.viewIcon?.image = UIImage(named: icons[count])
            displayController.viewTitle?.text = titles[count]
            

            pages.append(displayController)
        }
        
        setViewControllers([pages[0]], direction: .forward, animated: true, completion: nil)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        // Logic for previous viewController:
        guard let currentIndex = pages.firstIndex(of: viewController) else {return nil}
        let previousIndex = currentIndex - 1
        
        guard previousIndex >= 0 else {return pages.last}
        guard pages.count > previousIndex else {return nil}
        
        return pages[previousIndex]
    
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        // Logic for the next viewController:
        guard let currentIndex = pages.firstIndex(of: viewController) else {return nil}
        let nextIndex = currentIndex + 1
        
        guard nextIndex < pages.count else {return pages.first}
        guard pages.count > nextIndex else {return nil}
        
        return pages[nextIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        
        guard let pageVC = pageViewController.viewControllers?.first else {return 0}
        guard let pageVCIndex = pages.firstIndex(of: pageVC) else {return 0}
        
        return pageVCIndex
    }
    
}
