import UIKit

class SignUpViewController: UIViewController , UITextFieldDelegate {
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var userNameTxt: UITextField_BottomBorder!
    @IBOutlet weak var emailTxt: UITextField_BottomBorder!
    @IBOutlet weak var phoneNoTxt: UITextField_BottomBorder!
    @IBOutlet weak var passwordTxt: UITextField_BottomBorder!
    @IBOutlet weak var confirmPassTxt: UITextField_BottomBorder!
    @IBOutlet weak var signUpScrollOutlet: UIScrollView!
    
    //properties 
    
    var userName = ""
    var email = ""
    var phoneNo = ""
    var password = ""
    
    var URLforSignIn = "http://192.168.1.222/mobil_app/user_add_api.php"
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTxt.delegate = self
        emailTxt.delegate = self
        phoneNoTxt.delegate = self
        passwordTxt.delegate = self
        confirmPassTxt.delegate = self
        
        //for border
        signInButton.layer.borderColor = UIColor.white.cgColor
        signInButton.layer.borderWidth = 1.0
        
        
    }
    
    //delegate for textfields
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        signUpScrollOutlet.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        signUpScrollOutlet.setContentOffset(CGPoint(x: 0, y: 250), animated: true)
    }
    
    
    
    
    @IBAction func SignInButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func SignUPButtonAction(_ sender: Any) {
        userName = userNameTxt.text!
        email = emailTxt.text!
        phoneNo = phoneNoTxt.text!
        guard passwordTxt.text! == confirmPassTxt.text! else {
            print("give password again")
            return
        }
        password = passwordTxt.text!
        
        
        let params  = "email=\(email)&username=\(userName)&password=\(password)&customer_contact=\(phoneNo)"
        
        
        print(URLforSignIn)
        
        
        
        
        let jsonCall = APlCall()
        jsonCall.getDataFromJson(url: URLforSignIn, parameter: params, completion: { response in
            //print("ahib")
            print(response)
            let status = response["status"] as! String
            
            print(status)
            
        })

    
    }
   
}


