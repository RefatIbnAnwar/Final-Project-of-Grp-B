import UIKit

class EMICalculatorViewController: UIViewController , UITextFieldDelegate {

    
    @IBOutlet weak var loanAmountTxtField: UITextField!
    
    @IBOutlet weak var annualInterestRateTxtField: UITextField!
    
    @IBOutlet weak var loanTenureTxtField: UITextField!
    
    @IBOutlet weak var loanAmountLabel: UILabel!
    
    @IBOutlet weak var annualInterestRateLabel: UILabel!
    
    @IBOutlet weak var loanTenureLabel: UILabel!
    
    @IBOutlet weak var showCalculateSubView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loanAmountTxtField.delegate = self
        annualInterestRateTxtField.delegate = self
        loanTenureTxtField.delegate = self
        
        //back bar
        self.navigationItem.title = "EMI Calculator"
        let backButton = UIBarButtonItem()
        
        backButton.title = "Back"
        
        self.navigationController!.navigationBar.topItem!.backBarButtonItem = backButton

        
        // Do any additional setup after loading the view.
    }
    
    
    //delegate for textfields
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
        
    }
    
    
    //mark action 
    
    @IBAction func calculateButtonPressed(_ sender: Any) {
        
        // to show the subview
        showCalculateSubView.isHidden = true
        loanAmountLabel.text = loanAmountTxtField.text
        annualInterestRateLabel.text = annualInterestRateTxtField.text
        loanTenureLabel.text = loanTenureTxtField.text

        guard !(loanAmountLabel.text)!.isEmpty && !(annualInterestRateLabel.text)!.isEmpty && !(loanTenureLabel.text)!.isEmpty else {
            return
        }
        showCalculateSubView.isHidden = false
        
        
        //to hide the keyboard
        loanAmountTxtField.resignFirstResponder()
        annualInterestRateTxtField.resignFirstResponder()
        loanTenureTxtField.resignFirstResponder()
        
    }


}
