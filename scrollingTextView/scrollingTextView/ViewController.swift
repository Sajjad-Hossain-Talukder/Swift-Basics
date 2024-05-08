//
//  ViewController.swift
//  scrollingTextView
//
//  Created by Xotech on 05/05/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var newTextView: UITextView!{
        didSet{
            newTextView.isScrollEnabled = true
            newTextView.delegate = self
        }
    }
    private var textBuffer = ""
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }


}

extension ViewController : UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text)
    }
    
}

