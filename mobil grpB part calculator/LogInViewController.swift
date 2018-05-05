
import UIKit
import GoogleMobileAds

class LogInViewController: UIViewController, UITextFieldDelegate, GADBannerViewDelegate {
    
    //Mark: Properties
    @IBOutlet weak var sendPassword: UIButton!
    @IBOutlet weak var forgetPasswordUserName: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var forgetPasswordButton: UIButton!
    @IBOutlet weak var userNameTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var popUpForgetPasswordView: UIView!
    @IBOutlet weak var backgroundView: UIImageView!    
    @IBOutlet weak var scrollViewOutlet: UIScrollView!
 
   
 
    var URLforSignIn = "http://192.168.1.222/mobil_app/user_login_api.php"
    var params = ""
    var valueOfUserNameTextfield = ""
    var valueOfPasswordTextfield = ""
    var valueOfforgetPasswordUserName = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTxtField.delegate = self
        passwordTxtField.delegate = self
        forgetPasswordUserName.delegate = self
        
        //for border
        signUpButton.layer.borderColor = UIColor.white.cgColor
        signUpButton.layer.borderWidth = 1.0
        forgetPasswordButton.layer.borderColor = UIColor.white.cgColor
        forgetPasswordButton.layer.borderWidth = 1.0
        
        //for tap gesture
        let tap = UITapGestureRecognizer(target: self, action:#selector(DismissForgetPasswordView(sender:)) )
        tap.delegate = self as? UIGestureRecognizerDelegate
        backgroundView.addGestureRecognizer(tap)
    
       
    }
  
    //delegate for textfields
    func textFieldDidEndEditing(_ textField: UITextField) {
        valueOfUserNameTextfield = userNameTxtField.text!
        valueOfPasswordTextfield = passwordTxtField.text!
        valueOfforgetPasswordUserName = forgetPasswordUserName.text!
        
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == forgetPasswordUserName {
            scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        }else{
            scrollView.setContentOffset(CGPoint(x: 0, y: 250), animated: true)
        }
        
        
    }
    
    
    //mark: Action
    
    @IBAction func forgetPasswordButton(_ sender: Any) {
        
        popUpForgetPasswordView.isHidden = false
    }
    
    func DismissForgetPasswordView(sender: UITapGestureRecognizer){
        
        popUpForgetPasswordView.isHidden = true
}
    
    @IBAction func signinbuttonTapped(_ sender: Any) {
        
        UserDefaults.standard.set(userNameTxtField.text, forKey: "userName")
        UserDefaults.standard.set(passwordTxtField.text, forKey: "password")
 
        valueOfUserNameTextfield = userNameTxtField.text!
        valueOfPasswordTextfield = passwordTxtField.text!
        self.params  = "username=\(valueOfUserNameTextfield)&password=\(valueOfPasswordTextfield)"
        
        print(URLforSignIn)
        
        let jsonCall = APlCall()
        jsonCall.getDataFromJson(url: URLforSignIn, parameter: params, completion: { response in
            
            print(response)
            let status = response["success"] as! String
            
            if status == "true"
            {
                print("log in successful")
      
            }
            else {
                print("sorry")
            }
            
        })
        
    }
    
    @IBAction func ContinueGuestButton(_ sender: Any) {
        
        UserDefaults.standard.set(userNameTxtField.text, forKey: "userName")
        UserDefaults.standard.set(passwordTxtField.text, forKey: "password")
        print("guest btn action")
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "SignInSegue"
        {
            if let destinationVC = segue.destination as? DashboardViewController {
                destinationVC.userNameString = self.valueOfUserNameTextfield
                self.present(destinationVC, animated: true, completion: nil)
                
            }
        }
        
        if segue.identifier == "ContinueAsGuest" {
            if let dashVC = segue.destination as? DashboardViewController {
                self.present(dashVC, animated: true, completion: nil)
                print("guest prepare")
            }
        }
     
        
    }
    
    
    // storing session data
    override func viewDidAppear(_ animated: Bool) {
        if let name = UserDefaults.standard.object(forKey: "userName") as? String {
            userNameTxtField.text = name
        }
        if let password1 = UserDefaults.standard.object(forKey: "password") as? String {
            passwordTxtField.text = password1
        }

    }

    
    
    
    
    
    
}
