//
//  ZGConstants.swift
//  ZoGoo
//
//  Created by Salman Nasir on 20/02/2017.
//  Copyright © 2017 Salman Nasir. All rights reserved.
//

import UIKit



  struct setBoarder {
    let view : UIView?
    let width : CGFloat?
    let color : UIColor?
    
    @discardableResult  init(view: UIView, width: CGFloat , color : UIColor ) {
        self.view = view
        self.width  = width
        self.color  = color
        view.layer.borderColor = color.cgColor
        view.layer.borderWidth = 1
        
        

    }
}

enum WAUserType : Int
{
    case WAUser = 0 ,
    WAVendor
    
}

enum TQActionType: Int {
    case TQLogin = 0,
    TQSignup,
    TQForgetPassword ,
    TQSkip
}

var DEVICE_TOKEN: String = ""
let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEGHT = UIScreen.main.bounds.height
var DEVICE_LAT =  0.0
var DEVICE_LONG = 0.0
var DEVICE_ADDRESS = ""
var SELECTUSER = ""



let IS_IPHONE_5 = (UIScreen.main.bounds.width == 320)
let IS_IPHONE_6 = (UIScreen.main.bounds.width == 375)
let IS_IPHONE_6P = (UIScreen.main.bounds.width == 414)

//LIVE URL


//  API Contant

let BASE_URL  =  "http://studentsnetworkservices.com/sns/public/api/"


let LOGIN = BASE_URL + "login"
let CONTACT_US = BASE_URL + "contact"
let PROFILE = BASE_URL + "profile"





weak var localUserData: UserInformation!


let kUserNameRequiredLength: Int = 3
let kValidationMessageMissingInput: String = "Please fill all the fields"
let kEmptyString: String = ""
let kPasswordRequiredLength: Int = 5
let kUserNameRequiredLengthForPhone: Int = 9
let kValidationMessageMissingInputPhone : String = "Please give the proper phone Number"

let KValidationPassword : String = "Password must be greater 6 digits"
let kValidationEmailInvalidInput: String = "Please enter valid Email Address"
let kValidationEmailEmpty : String = "Login Id can't be blank"
let kValidationPasswordEmpty : String = "Password can't be blank"
let kValidationPhoneNumEmpty : String = "Phone Number can't be blank"

let kUpdateTokenMessage: String = "user does not exists"
let KMessageTitle: String = "SNS"
let KChoseCategory: String = "Choose Category"

let CURRENT_DEVICE = UIDevice.current
let KIDNumberValidat : String = "Id Number can't be blank"
let KIMAGeSELECT : String = "Please Select the image"

let kValidationNameInput: String = "Please Enter the name"
let kValidationNameInputCharacter : String = "Full Name must be alphabet characters.\n"
let kValidationConfirmPasswordEmpty : String = "Confirm Password can't be blank"
let KPasswordMismatch : String = "Password mismatch"

let KMESSAGEVALIDATION: String = "Please Enter the message"



let kValidationCardNumInput: String = "Card Number can't be blank"
let kValidationCardHolderNameInput: String = "Card Holder Name can't be blank"
let kValidationCardHolderNameInputCharacter : String = "Card Holder Name must be alphabet characters.\n"
let kValidationCardExpiryDate : String = "Expiry date can't be blank"
let kValidationCardCcvNum : String = "Ccv Number  can't be blank"



let MAIN                           = UIStoryboard(name: "Main", bundle: nil)
let HOME                           = UIStoryboard(name: "Home", bundle: nil)


struct VCIdentifier {
//   User ViewControllers
    static let kSRSelectOptionVC = "SRSelectOptionVC"
    static let kForgotPasswordController = "GSForgotPasswordVC"
    static let KSRLoginVC = "SRLoginVC"
    static let KSRRegisterVC = "SRRegisterVC"
    static let KEVENTDETAILVC = "SREventDetailVC"
    static let KVerifyAccountVC = "GHVerifyAccountVC"
    static let KBOOKEDEVENT = "SRBookedEventVC"
    static let KEVENTTOTALBILL = "SREventTotalBillVC"
    static let KSRPAYMENT = "SRPaymentVC"
    static let KPaymentConfirmation = "SRPaymentConfirmationVC"
    static let KMYTICKET = "SRMyTicketVC"

    
    
    
    
    static let KALLOWLOCATION = "SRAllowLocationVC"
    static let KALLOWNOTIFICATION = "SRNotificationAccessVC"
    static let KALLCLEAR = "SRAllClearVC"

    static let KAddCardInfo = "GSAddCardInfoVC"
    static let KAllowLocationViewController = "GSAllowLocationVC"
    static let KMYPOSTVC = "GSMyPostVC"
    static let KEDITPOST = "GSEditProfileVC"
    static let KSETTINGVC = "GSSettingVC"
    
    //Main  View Controller
    static let kMainTabbarController = "SRTabBarViewController"
    static let KRecentPostCell  = "RecentPostCell"
    static let kUserPostDetail = "GSPostDetailVC"
    static let KMorePhoteCell = "MorePhotoCell"
    static let kCHNAGEPASSWORD = "GHChangePasswordVC"
    static let kGSReferenceNumberVC = "GSReferenceNumberVC"
    static let kTermAndCondition = "GSAboutVC"
    
    static let kOrderDetailVC = "OrderDetailVC"
//    static let kEmployeeChatVC = "EmployeeChatViewController"
//    static let kEmployeeEditProfile = "EmployeeEditProfile"
//    static let kEmployeeNotification = "EmployeeNotification"
}



//

let kUserId                 : String = "user_id"
let kFirstName              : String = "firstname"
let kLastName               : String = "lastname"
let KFullName               : String = "name"
let KPhoneNum               : String = "phoneNumber"

let Klogin_id                  : String = "login_id"
let kPassword               : String = "password"
let kConfirmPassword        : String = "confirmPassword"
let KNewPassword               : String = "newPassword"
let KIdNumver               : String = "idNumber"

let KType                   : String  = "type"
let KCategory                   : String  = "category"
let KCountry                 : String  = "country"
let KCity                : String  = "city"
let KCompany                : String  = "company"



let KCODE                    : String = "code"
let KRESENTCODE              : String = "code"

let kSocialId               : String = "social_id"
let kProfileImage           : String = "profile_image"
let kSignupType             : String = "signup_type"
let kLatitude               : String = "latitute"
let kLongitude              : String = "longitude"
let kDeviceType             : String = "deviceType"
let kDeviceTOken              : String = "deviceToken"
let KImageFileName                : String = "profilePicture.png"
let KImageParam                : String = "profilePicture"

let KADDRESS              : String = "address"

let KImageIDCARDName               : String = "idNumberPicture.png"
let KImageIDCardParam                : String = "idNumberPicture"

let KDeviceType                  : String = "iOS"
let KProductName                 : String  = "productName"
let KProductCategory                 : String  = "productCategory"
let KProductAddress                : String  = "productLocalisation"
let KProductDescription                 : String  = "productDescription"
let KProductPrice                 : String  = "productPrice"
let KProductImage                 : String  = "productImages"
let KProductID                 : String  = "productId"
let KSentOfferPrice                : String  = "price"

let KProductfavourite                 : String  = "favourite"
let KFavouriteBadge                 : String  = "Badge"
let KFavouriteCount                : String  = "favouriteItemCount"
let KExpiryDate                : String  = "userCardExpiry"
let KCardHolderName                : String  = "userCardHolderName"
let KUserCardNumber                : String  = "userCardNumber"
let KCardCVVNum                : String  = "userCardCsv"
let KOfferSENT                : String  = "offerSent"
let KUPDATEPROFILE                : String  = "updateProfile"

let KACCEPTOFFER                : String  = "acceptOffer"
let KREJECTOFFER                : String  = "rejectOffer"
let KNEWOFFER                : String  = "newOffer"

let KStatus                : String  = "status"
let KOfferSendUserId                : String  = "offerSenderUserId"

let KOFFERId                 : String  = "offerId"
let KCONFIRMATIONMESSAGE                 : String  = "Garage Sale is working with Services  provider to confirm your Order "




