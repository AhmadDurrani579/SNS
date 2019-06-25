//
//  ManullyEntryVC.swift
//  SNS
//
//  Created by Ahmed Durrani on 24/04/2019.
//  Copyright © 2019 CyberHost. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0
import DatePickerDialog

class ManullyEntryVC: UIViewController {
    
    @IBOutlet weak var txtFlightNum: UITextField!
    @IBOutlet weak var txtFlightDate: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var btnGender: UIButton!
    @IBOutlet weak var btnDateOfBirth: UIButton!
    @IBOutlet weak var txtNationality: UITextField!
    @IBOutlet weak var txtContactNum: UITextField!
    @IBOutlet weak var txtWechatId: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassportNum: UITextField!
    @IBOutlet weak var txtLineId: UITextField!
    @IBOutlet weak var txtViperId: UITextField!
    @IBOutlet weak var txtWhatsId: UITextField!
    @IBOutlet weak var txtKakooId: UITextField!
    @IBOutlet weak var heoghtOFAirPortPickUp: NSLayoutConstraint!
    @IBOutlet weak var heightContraintlayout: NSLayoutConstraint!
    @IBOutlet weak var btnPSB: UIButton!
    @IBOutlet weak var txtArrivalTime: UITextField!
    @IBOutlet weak var txtTotalNumberOfPassenger: UITextField!
    @IBOutlet weak var btnFlightDate : UIButton!
    @IBOutlet weak var btnDestination: UIButton!
    @IBOutlet weak var txtKeyDetail: UITextField!
    @IBOutlet weak var btnAccomodationBooking: UIButton!
    @IBOutlet weak var heightOfKeyAndDetail: NSLayoutConstraint!
    var userInfo : UserInformation?
    @IBOutlet weak var lblAccomodationInterest: UILabel!
    @IBOutlet weak var btnAccomodationInterest: UIButton!
    @IBOutlet weak var viewOfLastPop: NSLayoutConstraint!
    @IBOutlet weak var viewOfAirport: UIView!
    @IBOutlet weak var viewOfBottomView: UIView!
    
    @IBOutlet var imgOfSoftCopy : UIImageView!
    @IBOutlet var imgOfPassPort : UIImageView!

    let photoPicker = PhotoPicker()
    var cover_imageOfSoftCopy : UIImage?
    var cover_imageOfPassport : UIImage?
    var isAccomodation = false
    
    @IBOutlet weak var btnArrivalTime: UIButton!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heoghtOFAirPortPickUp.constant = 0.0
        self.heightContraintlayout.constant = 780
        self.viewOfAirport.isHidden = true
        self.viewOfBottomView.isHidden = true

        viewOfLastPop.constant = 0.0
        WAShareHelper.setBorderAndCornerRadius(layer: txtFlightNum.layer, width: 1.0, radius: 1.0, color: UIColor.white)
        WAShareHelper.setBorderAndCornerRadius(layer: btnFlightDate.layer, width: 1.0, radius: 1.0, color: UIColor.white)
        WAShareHelper.setBorderAndCornerRadius(layer: txtArrivalTime.layer, width: 1.0, radius: 1.0, color: UIColor.white)
        WAShareHelper.setBorderAndCornerRadius(layer: txtTotalNumberOfPassenger.layer, width: 1.0, radius: 1.0, color: UIColor.white)
        WAShareHelper.setBorderAndCornerRadius(layer: txtArrivalTime.layer, width: 1.0, radius: 1.0, color: UIColor.white)
//        WAShareHelper.setBorderAndCornerRadius(layer: btnAccomodationInterest.layer, width: 1.0, radius: 1.0, color: UIColor.white)
        WAShareHelper.setBorderAndCornerRadius(layer: txtName.layer, width: 1.0, radius: 1.0, color: UIColor.white)
        WAShareHelper.setBorderAndCornerRadius(layer: btnGender.layer, width: 1.0, radius: 1.0, color: UIColor.white)
        WAShareHelper.setBorderAndCornerRadius(layer: btnDateOfBirth.layer, width: 1.0, radius: 1.0, color: UIColor.white)
        WAShareHelper.setBorderAndCornerRadius(layer: txtNationality.layer, width: 1.0, radius: 1.0, color: UIColor.white)
        WAShareHelper.setBorderAndCornerRadius(layer: txtContactNum.layer, width: 1.0, radius: 1.0, color: UIColor.white)
        WAShareHelper.setBorderAndCornerRadius(layer: txtWechatId.layer, width: 1.0, radius: 1.0, color: UIColor.white)
        WAShareHelper.setBorderAndCornerRadius(layer: txtEmail.layer, width: 1.0, radius: 1.0, color: UIColor.white)
        WAShareHelper.setBorderAndCornerRadius(layer: txtPassportNum.layer, width: 1.0, radius: 1.0, color: UIColor.white)
        WAShareHelper.setBorderAndCornerRadius(layer: txtWhatsId.layer, width: 1.0, radius: 1.0, color: UIColor.white)
        WAShareHelper.setBorderAndCornerRadius(layer: txtKakooId.layer, width: 1.0, radius: 1.0, color: UIColor.white)
        WAShareHelper.setBorderAndCornerRadius(layer: txtViperId.layer, width: 1.0, radius: 1.0, color: UIColor.white)
        WAShareHelper.setBorderAndCornerRadius(layer: txtLineId.layer, width: 1.0, radius: 1.0, color: UIColor.white)
        WAShareHelper.setBorderAndCornerRadius(layer: btnPSB.layer, width: 1.0, radius: 1.0, color: UIColor.white)
        WAShareHelper.setBorderAndCornerRadius(layer: btnDestination.layer, width: 1.0, radius: 1.0, color: UIColor.white)
        WAShareHelper.setBorderAndCornerRadius(layer: txtKeyDetail.layer, width: 1.0, radius: 1.0, color: UIColor.white)
        WAShareHelper.setBorderAndCornerRadius(layer: btnAccomodationBooking.layer, width: 1.0, radius: 1.0, color: UIColor.white)
        WAShareHelper.setBorderAndCornerRadius(layer: btnArrivalTime.layer, width: 1.0, radius: 1.0, color: UIColor.white)

        
        let tapGestureRecognizerforDp = UITapGestureRecognizer(target:self, action:#selector(ManullyEntryVC.imageTappedForDp(img:)))
        imgOfPassPort.isUserInteractionEnabled = true
        imgOfPassPort.addGestureRecognizer(tapGestureRecognizerforDp)
        
        
        let tapGestureRecognizerforDp1 = UITapGestureRecognizer(target:self, action:#selector(ManullyEntryVC.imgOfSoftCopy_Preesed(img:)))
        imgOfSoftCopy.isUserInteractionEnabled = true
        imgOfSoftCopy.addGestureRecognizer(tapGestureRecognizerforDp1)
    }

    @objc func imageTappedForDp(img: AnyObject)
    {
        photoPicker.pick(allowsEditing: false, pickerSourceType: .CameraAndPhotoLibrary, controller: self) {[weak self] (orignal, edited) in
            
            self!.imgOfPassPort.image = orignal
            let cgFloat: CGFloat = self!.imgOfPassPort.frame.size.width/2.0
            let someFloat = Float(cgFloat)
            WAShareHelper.setViewCornerRadius(self!.imgOfPassPort, radius: CGFloat(someFloat))
            self!.cover_imageOfPassport = orignal
            
        }
        
    }
    
    @objc func imgOfSoftCopy_Preesed(img: AnyObject)
    {
        photoPicker.pick(allowsEditing: false, pickerSourceType: .CameraAndPhotoLibrary, controller: self) {[weak self] (orignal, edited) in
            
            self!.imgOfSoftCopy.image = orignal
            let cgFloat: CGFloat = self!.imgOfSoftCopy.frame.size.width/2.0
            let someFloat = Float(cgFloat)
            WAShareHelper.setViewCornerRadius(self!.imgOfSoftCopy, radius: CGFloat(someFloat))
            self!.cover_imageOfSoftCopy = orignal
            
        }
        
    }
    
    @IBAction func btnBack_Pressed(_ sender : UIButton) {
        self.dismiss(animated: true) {
            
        }
    }
    
    @IBAction func btnArrivalTime_Pressed(_ sender: UIButton) {
        let datePicker = ActionSheetDatePicker(title: "Time:", datePickerMode: UIDatePicker.Mode.time, selectedDate: Date(), target: self, action: #selector(ManullyEntryVC.datePicked(_:)), origin: sender.superview!.superview)
        
//        datePicker?.minuteInterval = 12
        
        datePicker?.show()
    }
    
    @objc func datePicked(_ obj: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let dateValue = formatter.string(from: obj)
        self.btnArrivalTime.setTitle( dateValue , for: .normal)
//        btnArrivalTime.setTitle(obj.description, for: .normal)
    }

    
    @IBAction func btnSelectGender(_ sender: UIButton) {
        ActionSheetStringPicker.show(withTitle: "Select City", rows: ["Male" , "Female"] , initialSelection: 0 , doneBlock: { (picker, index, value) in
            self.btnGender.setTitle(value as? String, for: .normal)
            print("values = \(value!)")
            print("indexes = \(index)")
            print("picker = \(picker!)")
            return
        }, cancel: { (actionStrin ) in
            
        }, origin: sender)
    }
    
    @IBAction func btnDestination_Pressed(_ sender: UIButton) {
        ActionSheetStringPicker.show(withTitle: "Select Destination 目的地", rows: ["PSB hostel" , "Others"] , initialSelection: 0 , doneBlock: { (picker, index, value) in
            
            self.btnDestination.setTitle(value as? String, for: .normal)
            
            if index == 0 {
                  self.heightOfKeyAndDetail.constant = 0.0
            } else {
                self.heightOfKeyAndDetail.constant = 36.0
            }

            print("values = \(value!)")
            print("indexes = \(index)")
            print("picker = \(picker!)")
            return
        }, cancel: { (actionStrin ) in
            
        }, origin: sender)
        
    }
    
    @IBAction func btnFlightDate_Pressed(_ sender: UIButton) {
//        sender.isSelected = !sender.isSelected

        flightDate()
    }

    func flightDate() {

        let currentDate = Date()
        var dateComponents = DateComponents()
        dateComponents.month = 1970
        let threeMonthAgo = Calendar.current.date(byAdding: dateComponents, to: currentDate)

        let datePicker = DatePickerDialog(textColor: .black,
                                          buttonColor: .black,
                                          font: UIFont.boldSystemFont(ofSize: 17),
                                          showCancelButton: true)
        datePicker.show("DatePickerDialog",
                        doneButtonTitle: "Done",
                        cancelButtonTitle: "Cancel",
                        minimumDate: threeMonthAgo,
                        maximumDate: currentDate,
                        datePickerMode: .date) { (date) in
                            if let dt = date {

                                self.view.endEditing(true)
                                let formatter = DateFormatter()
                                //                                formatter.dateFormat = "yyyy-MM-dd"
                                formatter.dateFormat = "dd-MM-yyyy"

                                let dateValue = formatter.string(from: dt)

                                self.btnFlightDate.setTitle( dateValue , for: .normal)
                            }
        }
    }

    
    @IBAction func btnDateOfBirth(_ sender: UIButton) {
        datePickerTapped()

    }
    
    
    
    
    
    func datePickerTapped() {
        
        let currentDate = Date()
        var dateComponents = DateComponents()
        dateComponents.month = 1970
        let threeMonthAgo = Calendar.current.date(byAdding: dateComponents, to: currentDate)
        
        let datePicker = DatePickerDialog(textColor: .black,
                                          buttonColor: .black,
                                          font: UIFont.boldSystemFont(ofSize: 17),
                                          showCancelButton: true)
        datePicker.show("DatePickerDialog",
                        doneButtonTitle: "Done",
                        cancelButtonTitle: "Cancel",
                        minimumDate: threeMonthAgo,
                        maximumDate: currentDate,
                        datePickerMode: .date) { (date) in
                            if let dt = date {
                                
                                self.view.endEditing(true)
                                let formatter = DateFormatter()
                                formatter.dateFormat = "dd-MM-yyyy"
                                let dateValue = formatter.string(from: dt)
                                self.btnDateOfBirth.setTitle( dateValue , for: .normal)
                }
        }
    }
    
//    let datePicker = ActionSheetDatePicker(title: "Time:", datePickerMode: UIDatePicker.Mode.time, selectedDate: Date(), target: self, action: #selector(SWTableViewController.datePicked(_:)), origin: sender.superview!.superview)
//
//    datePicker?.minuteInterval = 20
//
//    datePicker?.show()


    @IBAction func btnPSBStay_Pressed(_ sender: UIButton) {
        ActionSheetStringPicker.show(withTitle: "Airport pickup if required 机场接机", rows: ["Yes" , "No"] , initialSelection: 0 , doneBlock: { (picker, index, value) in
            self.btnPSB.setTitle(value as? String, for: .normal)
            if index == 0 {
                self.heightContraintlayout.constant =  1130
                self.viewOfAirport.isHidden = false
                self.viewOfBottomView.isHidden = true
                self.heightOfKeyAndDetail.constant = 0.0
                self.heoghtOFAirPortPickUp.constant = 330

            } else {
                self.heightContraintlayout.constant = 780
                self.heoghtOFAirPortPickUp.constant = 0.0
                self.viewOfAirport.isHidden = true
                self.viewOfBottomView.isHidden = true


            }
            
            print("values = \(value!)")
            print("indexes = \(index)")
            print("picker = \(picker!)")
            return
        }, cancel: { (actionStrin ) in
            
        }, origin: sender)
    }
    
    @IBAction func btnAccomodation_Pressed(_ sender: UIButton) {
        ActionSheetStringPicker.show(withTitle: "Accommodation Booking 住宿预订", rows: ["Yes" , "No"] , initialSelection: 0 , doneBlock: { (picker, index, value) in
            self.btnAccomodationBooking.setTitle(value as? String, for: .normal)
            if index == 0 {
                self.isAccomodation = true
                self.heightContraintlayout.constant =  1290
                self.viewOfLastPop.constant = 100
                self.viewOfAirport.isHidden = false
                self.viewOfBottomView.isHidden = false

                
            } else {
                self.heightContraintlayout.constant =  1130.0
                self.viewOfLastPop.constant = 0.0
                self.isAccomodation = false

                self.viewOfAirport.isHidden = false
                self.viewOfBottomView.isHidden = true

            }
            
            print("values = \(value!)")
            print("indexes = \(index)")
            print("picker = \(picker!)")
            return
        }, cancel: { (actionStrin ) in
            
        }, origin: sender)
    }
   
//    @IBAction func btnAccomodationInterest_Pressed(_ sender: UIButton) {
//        ActionSheetStringPicker.show(withTitle: "Airport pickup if required 机场接机", rows: ["1-Bedroom Apartment Quad Sharing ($642)" , "Bedroom Apartment 4 Sharing  – 2 beds per room ($877.40)", "2-Bedroom Apartment 6 Sharing  – 3 beds per room($588.50)"] , initialSelection: 0 , doneBlock: { (picker, index, value) in
//            self.lblAccomodationInterest.text = value as? String
//
//
//            print("values = \(value!)")
//            print("indexes = \(index)")
//            print("picker = \(picker!)")
//            return
//        }, cancel: { (actionStrin ) in
//
//        }, origin: sender)
//    }

    
    @IBAction func btnSubmit_Pressed(_ sender: UIButton) {
//        PROFILE
        
        var airportPickUp : String?
        var flightDate : String?
        var arrivalTime : String?
        var flightNum : String?
        var destination : String?
        var accomodation : String?
        var weeChatId : String?
        var whatsAppID : String?
        var vooperID : String?
        var lineId : String?
        var kakooId : String?

        
        if btnPSB.titleLabel?.text == nil {
            airportPickUp = " "
        } else {
            airportPickUp = btnPSB.titleLabel?.text
        }
        
        
        
        if btnFlightDate.titleLabel?.text == nil {
            flightDate = "12:00 Am"
        } else {
            flightDate = btnFlightDate.titleLabel?.text
        }
        
//        if txtArrivalTime.text?.count == 0 {
//            arrivalTime = "12:00 Am"
//        } else {
//            arrivalTime = txtArrivalTime.text!
//        }
        if txtFlightNum.text?.count == 0 {
            flightNum = "2343"
        } else {
            flightNum = txtFlightNum.text!
        }
        
        if txtKeyDetail.text?.count == 0 {
            destination = self.btnDestination.titleLabel?.text
        } else {
            destination = txtKeyDetail.text!
        }
        
        if btnAccomodationBooking.titleLabel!.text == nil {
            accomodation = "YES"
        } else {
            accomodation = btnAccomodationBooking.titleLabel?.text
        }
        if txtWechatId.text?.count == 0 {
            weeChatId = "123abc"
        } else {
            weeChatId = txtWechatId.text!
        }
        
        if txtLineId.text?.count == 0 {
            lineId  = "123abc"
        } else {
            lineId = txtLineId.text!
        }
        
        if txtWhatsId.text?.count == 0 {
            whatsAppID  = "123abc"
        } else {
            whatsAppID = txtWhatsId.text!
        }
        
        if txtKakooId.text?.count == 0 {
            kakooId  = "123abc"
        } else {
            kakooId = txtKakooId.text!
        }
        
        if txtViperId.text?.count == 0 {
            vooperID  = "123abc"
        } else {
            vooperID = txtViperId.text!
        }
        
        if btnArrivalTime.titleLabel?.text == nil  {
            arrivalTime = "12:00"
        } else {
            arrivalTime = btnArrivalTime.titleLabel?.text!
        }
        
        let apiToken = userInfo?.api_token
        let  loginParam =      [ "api_token"                      : apiToken! ,
                                "full_name_per_passport"          : txtName.text! ,
                                "guardian_consent"                : "no" ,
                                "passport_no"                     : txtPassportNum.text ?? " " ,
                                "flight_data"                     : btnFlightDate.titleLabel!.text ?? " " ,
                                "name"                            : txtName.text ?? " " ,
                                "gender"                          : btnGender.titleLabel!.text ?? " " ,
                                "d_o_b"                           : btnDateOfBirth.titleLabel!.text ?? " " ,
                                "nationality"                     : txtNationality.text ?? " "  ,
                                "contact_no"                      : txtContactNum.text ?? " " ,
                                "email"                           : txtEmail.text ?? " " ,
                                "Wechat_id"                       : weeChatId! ,
                                "Line_id"                         : lineId! ,
                                "Viper_id"                        : vooperID! ,
                                "Whatsapp_id"                     : whatsAppID! ,
                                "Kakao_id"                        : kakooId! ,
                                "airport_pickup"                  : airportPickUp!  ,
                                "arrival_date"                    : flightDate! ,
                                "arrival_time"                    : arrivalTime! ,
                                "flight_number"                   : flightNum! ,
                                "destination"                     : destination! ,
                                "accomodation_booking"            : accomodation! ,
                                "accomodation_interest"           : "4 Persons"
            
                            ] as [String : Any]
        
        WebServiceManager.multiPartImageWithOutHeader(params: loginParam as Dictionary<String, AnyObject> , serviceName: PROFILE , imageParam:"passport_size_image", imgFileName: "passport_size_image.png", secondImageParam : "passport_soft_copy" , secondFileName : "passport_soft_copy.png" , serviceType: "Sign Up", profileImage: imgOfPassPort.image,secondProfile : self.imgOfSoftCopy.image , cover_image_param: "", cover_image: nil , modelType: UserResponse.self, success: {[weak self] (response) in
            let responseObj = response as! UserResponse
            if responseObj.success == true {
                
                self?.showAlertViewWithTitle(title: KMessageTitle, message: responseObj.message!, dismissCompletion: {
                    if self?.isAccomodation == true {
                        let vc = self?.storyboard?.instantiateViewController(withIdentifier: "WebViewLoadVC") as? WebViewLoadVC
                        vc?.delegate = self
                        
                        self?.present(vc!, animated: true, completion: {
                            
                        })
                        
                        
                    
                    } else {
                        self?.dismiss(animated: true) {
                            
                        }
                    }
                })
            }
            else
            {
                self!.showAlert(title: KMessageTitle, message: responseObj.message!, controller: self)

            }
            
        }) { [weak self](error) in
            
            
        }

    }

}

extension ManullyEntryVC : webViewLoadDelegate {
    func isWebViewLoad() {
        self.dismiss(animated: true) {
            
        }
    }
}
