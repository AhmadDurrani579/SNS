//
//  DataModel.swift
//  ADIM
//
//  Created by Ahmed Durrani on 06/10/2017.
//  Copyright © 2017 Expert_ni.halal_Pro. All rights reserved.
//

import Foundation
import ObjectMapper
import AlamofireObjectMapper


class UserResponse: Mappable {
    
    var success                                     :       Bool?
    var message                                     :       String?
    var code                                        :       Int?
    var data                                        :       UserInformation?
    var userProfileInfo                             :       ProfileInfo?
    var uploadInfo                                  :       ProfileInfoUpdate?


    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        

        success          <- map["success"]
        message          <- map["message"]
        code             <- map["code"]
        data             <- map["data"]
        userProfileInfo  <- map["data"]
        uploadInfo       <- map["data"]
        
    }
}

class UserInformation : Mappable {
    var id   : String?
    var email    : String?
    var login_id    : String?
    var api_token    : String?
    var type    : String?

    
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        email  <- map["email"]
        login_id  <- map["login_id"]
        api_token  <- map["api_token"]
        type  <- map["type"]

        
    }
}

class ProfileInfo : Mappable {
    var name   : String?
    var email    : String?
    var phone_no    : String?
    var message    : String?
    
    
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        email  <- map["email"]
        phone_no  <- map["phone_no"]
        message  <- map["message"]
        
        
    }
}


class ProfileInfoUpdate : Mappable {
    var user_id   : Int?
    var full_name_per_passport    : String?
    var gender    : String?
    var nationality    : String?
    var d_o_b    : String?
    var contact_no    : String?
    var email    : String?
    var passport_no    : String?
    var Wechat_id    : String?
    var passport_size_image    : String?
    var airport_pickup    : String?

    
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        user_id <- map["user_id"]
        full_name_per_passport  <- map["full_name_per_passport"]
        gender  <- map["gender"]
        nationality  <- map["nationality"]
        d_o_b  <- map["d_o_b"]
        contact_no  <- map["contact_no"]
        email  <- map["email"]
        passport_no  <- map["passport_no"]
        Wechat_id  <- map["Wechat_id"]
        passport_size_image  <- map["passport_size_image"]
        airport_pickup  <- map["airport_pickup"]

        
    }
}





class UserObjectInfo : Mappable {
    
    var id                                   :       Int?
    var name                                 :       String?
    var email                                :       String?
    var profilePicture                       :       String?
    var type                                 :       String?
    var country                                 :       String?
    var city                                 :       String?

    var accountActivationStatus              :       String?
    var activationCode                       :       String?
    var activationCodeUpdatedAt              :       String?
    var accountStatus                        :       String?
    var phoneNumber                          :       String?
    var deviceType                           :       String?
    var deviceToken                          :       String?
    var latitute                             :       String?
    var longitude                            :       String?
    var token                                :       String?
    var profilePictureLink                   :       String?
    var address                              :       String?
//    var productList                          :       [GetUserPostObject]?
    
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        email <- map["email"]
        profilePicture <- map["profilePicture"]
        type <- map["type"]
        country <- map["country"]
        city <- map["city"]

        accountActivationStatus <- map["accountActivationStatus"]
        activationCode <- map["activationCode"]
        accountStatus <- map["accountStatus"]
        phoneNumber <- map["phoneNumber"]
        deviceType <- map["deviceType"]
        deviceToken <- map["deviceToken"]
        latitute <- map["latitute"]
        longitude <- map["longitude"]
        token <- map["token"]
        profilePictureLink <- map["profilePictureLink"]
//        productList        <- map["products"]
        address             <- map["address"]
    }
}

class MyTicketList : Mappable {
    
    var id                                    :       Int?
    var noOfTickets                                 :       String?
    var ticketBookedAt                     :       String?
    var eventId                              :       Int?
    var eventTitle                                 :       String?
    var eventCategory                                :       String?
    var eventimage                             :       String?
    
    //    var productList                          :       [GetUserPostObject]?
    
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        id <- map["id"]
        noOfTickets <- map["noOfTickets"]
        ticketBookedAt <- map["ticketBookedAt"]
        eventId <- map["eventId"]
        eventTitle <- map["eventTitle"]
        eventCategory <- map["eventCategory"]
        eventimage <- map["eventimage"]
    }
}



class CountryList : Mappable {
    
    var id                                    :       Int?
    var name                                  :       String?

    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        
        id <- map["id"]
        name <- map["name"]
        
    }
}

class CityList : Mappable {
    
    var name                                  :       String?
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        
        name <- map["name"]
        
    }
}


class EventObjectList : Mappable {
    
    var id                                    :       Int?
    var title                                 :       String?
    var descriptionOfRace                     :       String?
    var category                              :       String?
    var image                                 :       String?
    var ticket                                :       String?
    var eventDate                             :       String?
    var eventTime                             :       String?
    var status                                :       String?
    var latitute                              :       String?
    var longitude                             :       String?
    var eventType                             :       String?
    var bookedStatus                          :       Bool?
    var ticketObject                          :       TicketsObject?
    
    //    var productList                          :       [GetUserPostObject]?
    
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        descriptionOfRace <- map["description"]
        category <- map["category"]
        image <- map["image"]
        ticket <- map["ticket"]
        eventDate <- map["eventStartDate"]
        eventTime <- map["eventStartTime"]
        status <- map["status"]
        latitute <- map["latitute"]
        longitude <- map["longitude"]
        eventType  <- map["eventType"]
        bookedStatus <- map["bookedStatus"]
        ticketObject    <- map["tickets"]
    }
}

class TicketsObject: Mappable {
    
    var userList                             :       [UserObjectInfo]?
    var racerList                            :       [UserObjectInfo]?
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        userList <- map["users"]
        racerList <- map["racers"]
        
    }
}




class PostImagesList: Mappable {
    
    var imageName                          :       String?
    var imageWidth                          :       String?
    var imageHeight                           :       String?
    var product_id                           :       String?
    var imageLink                           :       String?
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        imageName <- map["imageName"]
        imageWidth <- map["imageWidth"]
        imageHeight <- map["imageHeight"]
        product_id <- map["product_id"]
        imageLink <- map["imageLink"]

    }
}

class UserOfferDetail : Mappable {
    
    var id                              :       Int?
    var price                           :       String?
    var user_id                         :       String?
    var product_id                      :       String?
    var status                          :       String?

    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        id <- map["id"]
        price <- map["price"]
        user_id <- map["user_id"]
        product_id <- map["product_id"]
        status <- map["status"]
    }
}



class OrderList : Mappable {
    
    var id                                    :       String?
    var referenceNumber                       :       String?
    var offer_id                              :       String?
    var tax                                   :       String?
    var price                                 :       String?
    var totalPrice                            :       String?
    var deliverStatus                         :       String?
    var user_id                               :       String?
    var product_id                            :       String?
    var status                                :       String?
    var statusUpdatedAt                       :       String?
    var orderCreatedAt                        :       String?
    var offerCreatedAt                            :       String?

    var user                                  :       UserObjectInfo?
//    var product                               :       GetUserPostObject?
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        id                  <- map["order_id"]
        referenceNumber     <- map["referenceNumber"]
        offer_id            <- map["offer_id"]
        tax                 <- map["tax"]
        price               <- map["price"]
        totalPrice          <- map["totalPrice"]
        deliverStatus       <- map["orderDeliverStatus"]
        user_id             <- map["user_id"]
        product_id          <- map["product_id"]
        user                <- map["user"]
        status              <- map["status"]
        statusUpdatedAt     <- map["statusUpdatedAt"]
//        product             <- map["product"]
        orderCreatedAt          <- map["orderCreatedAt"]
        offerCreatedAt          <- map["offerCreatedAt"]

    }
}

class OrderPlaceObject : Mappable {
    
    var offer_id: String?
    var referenceNumber: String?
    var tax: String?
    var price : String?
    var totalPrice : Double?
    var id : Int?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        offer_id <- map["offer_id"]
        referenceNumber <- map["referenceNumber"]
        tax <- map["tax"]
        price <- map["price"]
        totalPrice <- map["totalPrice"]
        id <- map["id"]
        
    }
}

class LanguageObject : Mappable {
    
    var language: String?
    var flag: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        language <- map["language"]
        flag <- map["flag"]
    }
}


class ProductObject: Mappable {
    
    var success                          :       Bool?
    var message                          :       String?
    var status                           :       Int?
    var responsedata                     :       ResponseData?
    var productDetail                    :       [ProductDetailObject]?
    
    
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        success <- map["success"]
        message <- map["message"]
        status <- map["status"]
        responsedata <- map["responseData"]

        productDetail <- map["data"]
        
        
        
    }
}

class ResponseData: Mappable {
    
    var translatedText                          :       String?
    
    
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        translatedText <- map["translatedText"]
        
    }
}


class CategoryList: Mappable {
    
    var success                          :       Bool?
    var message                          :       String?
    var status                           :       Int?
    var categoriesList                    :       [CategoryObject]?
    
    
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        success <- map["success"]
        message <- map["message"]
        status <- map["status"]
        categoriesList <- map["data"]
        
        
        
    }
}

class CategoryObject : Mappable {
    
    var id: Int?
    var title: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
    }
}

class UniversityList: Mappable {
    
    var success                          :       Bool?
    var message                          :       String?
    var status                           :       Int?
    var categoriesList                    :      [UniversityObject]?
    
    
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        success <- map["success"]
        message <- map["message"]
        status <- map["status"]
        categoriesList <- map["data"]
        
        
        
    }
}

class UniversityObject : Mappable {
    
    var id: String?
    var name: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
}

//class CountryList: Mappable {
//
//    var success                          :       Bool?
//    var message                          :       String?
//    var status                           :       Int?
//    var countryList                        :      [CountryListObject]?
//
//
//
//    required init?(map: Map){
//
//    }
//    func mapping(map: Map) {
//        success <- map["success"]
//        message <- map["message"]
//        status <- map["status"]
//        countryList <- map["data"]
//
//
//
//    }
//}

//class CountryListObject : Mappable {
//
//    var name: String?
//
//    required init?(map: Map){
//
//    }
//
//    func mapping(map: Map) {
//        name <- map["name"]
//    }
//}


class StateList: Mappable {
    
    var success                          :       Bool?
    var message                          :       String?
    var status                           :       Int?
    var stateList                        :      [StateListObject]?
    
    
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        success <- map["success"]
        message <- map["message"]
        status <- map["status"]
        stateList <- map["data"]
        
        
        
    }
}

class StateListObject : Mappable {
    
    var name: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
    }
}


class ProductDetailObject : Mappable {

    var id: Int?
    var title: String?
    var price: String?
    var isbn: String?
    var condition : String?
    var phone : String?
    var availble : String?
    var description     : String?
    var propic     : String?
    var name : String?
    var userpic : String?
    var images  : AllImages?



    required init?(map: Map){

    }

    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        price <- map["price"]
        isbn <- map["isbn"]
        condition <- map["condition"]
        phone <- map["phone"]
        availble <- map["availble"]
        description <- map["description"]
        propic <- map["propic"]
        name <- map["name"]
        userpic <- map["userpic"]
        images  <- map["images_all"]





    }
}

class AllImages: Mappable {
    
    var file0                             : String?
    var file1                             : String?
    
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        file0 <- map["file0"]
        file1 <- map["file1"]
        
        
    }
}

class Book: Mappable {
    
    var book                             :       BookDetailObject?
    var errorMessage                     : String?
    
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        book <- map["book"]
        errorMessage <- map["errorMessage"]
        
        
    }
}

class BookDetailObject : Mappable {
    
    var publisher: String?
    var image: String?
    var title_long: String?
    var edition : String?
    var date_published : String?
    var title : String?
    var isbn13     : String?
    var binding     : String?
    var publish_date : String?
    var isbn : String?
    
    
    
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        publisher <- map["publisher"]
        image <- map["image"]
        title_long <- map["title_long"]
        edition <- map["edition"]
        date_published <- map["date_published"]
        title <- map["title"]
        isbn13 <- map["isbn13"]
        binding <- map["binding"]
        publish_date <- map["publish_date"]
        isbn <- map["isbn"]
        
        
        
        
        
    }
}

