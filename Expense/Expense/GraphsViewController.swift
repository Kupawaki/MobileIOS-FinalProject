//
//  GraphsViewController.swift
//  Expense
//
//  Created by student on 4/5/22.
//

import UIKit
import SwiftUI

class GraphsViewController: UIViewController {
    @IBOutlet weak var theContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let childView = UIHostingController(rootView: GraphsSwiftUI())
        addChild(childView)
        
        childView.view.frame = theContainer.bounds
        theContainer.addSubview(childView.view)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
