import UIKit

class CalculatorViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController!.navigationBar.topItem!.backBarButtonItem = backButton
        
    }

    

}

