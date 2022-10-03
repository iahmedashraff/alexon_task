//
//  ViewController.swift
//  Alexon_Task
//
//  Created by Ahmed Ashraf on 03/10/2022.
//

import UIKit

class OnboardingVC: UIViewController, UIScrollViewDelegate {
    // MARK: - Constanse
    var slides:[Slide] = []
    
    // MARK: - Outlets
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.delegate = self

        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        
        pageController.numberOfPages = slides.count
        pageController.currentPage = 0
        view.bringSubviewToFront(pageController)
        
    }

    
    // MARK: - IBAcions
    
    
    // MARK: - HelperFunctions
    func createSlides() -> [Slide] {

            let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
            slide1.imageView.image = UIImage(named: "Onboarding1")
            slide1.lblTitle.text = "Browse your  menu and order directly"
            slide1.lblDescribtion.text = "Our app can send you everywhere, even space. For only $2.99 per month"
            slide1.btnNext.layer.cornerRadius = slide1.btnNext.layer.frame.height / 2
            

        
        
        
        
            let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
            slide2.imageView.image = UIImage(named: "Onboarding2")
            slide2.lblTitle.text = "Even to space with us! Together"
            slide2.lblDescribtion.text = "Our app can send you everywhere, even space. For only $2.99 per month"
            slide2.btnNext.layer.cornerRadius = slide1.btnNext.layer.frame.height / 2
        
            
            let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
            slide3.imageView.image = UIImage(named: "Onboarding1")
            slide3.lblTitle.text = "Pickup delivery at your door"
            slide3.lblDescribtion.text = "Our app can send you everywhere, even space. For only $2.99 per month"
            slide3.btnNext.layer.cornerRadius = slide1.btnNext.layer.frame.height / 2
        slide3.btnNext.addTapGesture {
                    let vc = UIStoryboard(name: "Register", bundle: nil).instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
        }
            
            return [slide1, slide2, slide3]
        }
    func setupSlideScrollView(slides : [Slide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageController.currentPage = Int(pageIndex)
               
    }
    @objc func nextBtn(){
        setupSlideScrollView(slides: slides)
        
    }
//    @objc func skipBtn(){
//        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WelcomeVC") as! WelcomeVC
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: true)
//
//    }
    
}

