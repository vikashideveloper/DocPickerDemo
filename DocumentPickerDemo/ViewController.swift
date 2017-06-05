//
//  ViewController.swift
//  DocumentPickerDemo
//
//  Created by Vikash Kumar on 08/05/17.
//  Copyright © 2017 Vikash Kumar. All rights reserved.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pickDocumentButtonClicked(sender: UIButton) {
        documentMenuPicker()
    }

    func importDocumentsFromICloud() {
        let picker = UIDocumentPickerViewController(documentTypes: [kUTTypeItem as String], in: .import)
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    
    func exportDocumentsAtICloud() {
        let picker = UIDocumentPickerViewController(documentTypes: ["public.composite-content"], in: .exportToService)
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }

    
    func documentMenuPicker() {
        let menuPicker = UIDocumentMenuViewController(documentTypes: ["public.composite-content"], in: .import)
        menuPicker.delegate = self
        self.present(menuPicker, animated: true, completion: nil)

    }

}

extension ViewController : UIDocumentPickerDelegate, UIDocumentMenuDelegate {
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        print("Document URL \(url)")
    
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        
    }
    
    func documentMenu(_ documentMenu: UIDocumentMenuViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
    
        documentPicker.delegate = self
        present(documentPicker, animated: true, completion: nil)
    }
}

