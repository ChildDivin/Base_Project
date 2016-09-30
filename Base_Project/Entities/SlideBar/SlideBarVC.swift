//
//  SlideBarVC.swift
//  Booking_system
//
//  Created by Tops on 4/22/16.
//  Copyright © 2016 Tops. All rights reserved.
//

import UIKit
import SWRevealViewController

class SlideBarVC: UIViewController  {
    @IBOutlet weak var tblview:UITableView!
    @IBOutlet weak var imgProfile:UIImageView!
    @IBOutlet weak var lblUserName:UILabel!
    var arrMenu:NSMutableArray = []
    var strTypePre:String = ""
    
    //MARK: VIEW CYCLE START
    override func viewDidLoad() {
        super.viewDidLoad()
        tblview.registerNib(UINib(nibName: "SliderTableViewCell", bundle: nil), forCellReuseIdentifier: "MyCell")
        arrMenu = NSMutableArray()
        
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "NotificationIdentifier", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(SlideBarVC.gotomoney(_:)), name: "NotificationIdentifier", object: nil)
        
        NSNotificationCenter.defaultCenter().removeObserver(self, name:Global.notification.upcoming_Therapist, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name:Global.notification.previous_Therapist, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name:Global.notification.upcoming_Bookigs, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name:Global.notification.todays_Bookigs, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(SlideBarVC.gotoUpcoming(_:)), name:Global.notification.upcoming_Therapist, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(SlideBarVC.gotoPrevious(_:)), name:Global.notification.previous_Therapist, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(SlideBarVC.gotoUpcoming_bookings(_:)), name:Global.notification.upcoming_Bookigs, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(SlideBarVC.gotoTodays_bookings(_:)), name:Global.notification.todays_Bookigs, object: nil)
        
        strTypePre = StaticClass().retriveFromUserDefaults(Global.g_UserDefaultKey.IS_Therapist) as! String
        if strTypePre == "1" {
            setUpSliderMenuForTherapist()
            
        }else {
            setUpSliderMenuForClient()
            
        }
        
        let firstIndexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tblview.selectRowAtIndexPath(firstIndexPath, animated: true, scrollPosition: .Top)
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let strName = "\(StaticClass().retriveFromUserDefaults(Global.g_UserData.USERFIRSTNAME) as! String) \(StaticClass().retriveFromUserDefaults(Global.g_UserData.USERLASTNAME) as! String)"
        lblUserName.text = strName
        if strTypePre == "1" {
            let strUrl = StaticClass().retriveFromUserDefaults(Global.g_UserData.USERPROFILEIMAGEURL) as? String
            imgProfile.setImageWithURL(NSURL(string: strUrl!), usingActivityIndicatorStyle: .White)
            imgProfile.hidden = false
        }else {
            imgProfile.hidden = true
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if strTypePre == "1" {
            imgProfile.layer.cornerRadius = imgProfile.frame.size.width/2
            imgProfile.layer.borderColor = StaticClass().colorWithHexString("#888D7F", alpha: 1).CGColor //888D7F
            imgProfile.layer.borderWidth = 2.5
            imgProfile.viewTrnsformAnimation()
        }
        
        /* let color:CABasicAnimation = CABasicAnimation(keyPath: "borderColor")
        color.fromValue=UIColor.redColor().CGColor
        color.toValue=UIColor.blueColor().CGColor
        self.view.layer.backgroundColor = UIColor.blueColor().CGColor
        
        let Width:CABasicAnimation = CABasicAnimation(keyPath: "borderWidth")
        Width.fromValue=2
        Width.toValue=4
        Width.duration=4
        self.view.layer.borderWidth=4
        
        let both:CAAnimationGroup = CAAnimationGroup()
        both.duration = 0.5
        both.animations = [color,Width]
        both.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        self.imgProfile.layer.addAnimation(both, forKey: "color and Width")*/
    }
    
    //MARK: SLIDER MENU FOR THERAPIST SCREEN 
    func setUpSliderMenuForTherapist(){
        
        let dict1:NSMutableDictionary  = NSMutableDictionary()
        dict1.setValue("Dashboard", forKey: "Title")
        dict1.setValue("dashboard_icon", forKey: "icon")
        dict1.setValue(0, forKey: "Badge")
        arrMenu.addObject(dict1)
        
        let dict3:NSMutableDictionary  = NSMutableDictionary()
        dict3.setValue("My Calendar", forKey: "Title")
        dict3.setValue("my_calender_icon", forKey: "icon")
        dict3.setValue(0, forKey: "Badge")
        arrMenu.addObject(dict3)
        
        let dict4:NSMutableDictionary  = NSMutableDictionary()
        dict4.setValue("Previous Bookings", forKey: "Title")
        dict4.setValue("previous_bookings_icon", forKey: "icon")
        dict4.setValue(0, forKey: "Badge")
        arrMenu.addObject(dict4)
        
        let dict5:NSMutableDictionary  = NSMutableDictionary()
        dict5.setValue("Upcoming Bookings", forKey: "Title")
        dict5.setValue("upcoming_booking_icon", forKey: "icon")
        dict5.setValue(0, forKey: "Badge")
        arrMenu.addObject(dict5)
        
        let dict6:NSMutableDictionary  = NSMutableDictionary()
        dict6.setValue("My Money", forKey: "Title")
        dict6.setValue("my_money_icon", forKey: "icon")
        dict6.setValue(0, forKey: "Badge")
        arrMenu.addObject(dict6)
        
        let dict61:NSMutableDictionary  = NSMutableDictionary()
        dict61.setValue("My Location", forKey: "Title")
        dict61.setValue("location_icon", forKey: "icon")
        dict61.setValue(0, forKey: "Badge")
        arrMenu.addObject(dict61)
        
        let dict7:NSMutableDictionary  = NSMutableDictionary()
        dict7.setValue("Contact Us", forKey: "Title")
        dict7.setValue("contact_us_icon", forKey: "icon")
        dict7.setValue(0, forKey: "Badge")
        arrMenu.addObject(dict7)
        
        let dict8:NSMutableDictionary  = NSMutableDictionary()
        dict8.setValue("Settings", forKey: "Title")
        dict8.setValue("setting", forKey: "icon")
        dict8.setValue(0, forKey: "Badge")
        arrMenu.addObject(dict8)
    }
    func setUpSliderMenuForClient(){
        
        let dict3:NSMutableDictionary  = NSMutableDictionary()
        dict3.setValue("Book a treatment", forKey: "Title")
        dict3.setValue("upcoming_booking_icon", forKey: "icon")
        dict3.setValue(0, forKey: "Badge")
        arrMenu.addObject(dict3)
        
        let dict2:NSMutableDictionary  = NSMutableDictionary()
        dict2.setValue("My Profile", forKey: "Title")
        dict2.setValue("my_profile_icon", forKey: "icon")
        dict2.setValue(0, forKey: "Badge")
        arrMenu.addObject(dict2)
        
        let dict4:NSMutableDictionary  = NSMutableDictionary()
        dict4.setValue("Payment Details", forKey: "Title")
        dict4.setValue("previous_bookings_icon", forKey: "icon")
        dict4.setValue(0, forKey: "Badge")
        arrMenu.addObject(dict4)
        
        /*let dict5:NSMutableDictionary  = NSMutableDictionary()
        dict5.setValue("Previous Bookings", forKey: "Title")
        dict5.setValue("previous_bookings_icon", forKey: "icon")
        dict5.setValue(0, forKey: "Badge")
        arrMenu.addObject(dict5)*/
        
        let dict6:NSMutableDictionary  = NSMutableDictionary()
        dict6.setValue("My Bookings", forKey: "Title")
        dict6.setValue("upcoming_booking_icon", forKey: "icon")
        dict6.setValue(0, forKey: "Badge")
        arrMenu.addObject(dict6)
        
        
        let dict8:NSMutableDictionary  = NSMutableDictionary()
        dict8.setValue("Settings", forKey: "Title")
        dict8.setValue("setting", forKey: "icon")
        dict8.setValue(0, forKey: "Badge")
        arrMenu.addObject(dict8)
    }
    
    //MARK: TABLEVIEW DATASOURCE AND DELEGATE METHODS
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMenu.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:SliderTableViewCell = tblview.dequeueReusableCellWithIdentifier("MyCell") as! SliderTableViewCell
        cell.selectionStyle = .None
        cell.selected = true
        self.aplyCellData(cell, withIndex: indexPath.row)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        if strTypePre == "1" {
            didSelectedThrepistCell(indexPath)
        }else{
            didSelectedClientCell(indexPath)
        }
    }
    
    //MARK: THREAPIST CLICK EVENT METHODS
    func didSelectedThrepistCell(index:NSIndexPath){
        if index.row == 0 {
            let ObjHome : HomeVC = HomeVC (nibName:"HomeVC",bundle:nil)
            let navHome : UINavigationController = UINavigationController(rootViewController:ObjHome)
            navHome.navigationBarHidden = true
            revealViewController().setFrontViewController(navHome, animated: true)
            revealViewController().setFrontViewPosition(FrontViewPosition.LeftSideMost, animated: true)
        }
        else if index.row == 1 {
            let ObjCalendar : MyCalendarVC = MyCalendarVC (nibName:"MyCalendarVC",bundle:nil)
            let navCal : UINavigationController = UINavigationController(rootViewController:ObjCalendar)
            navCal.navigationBarHidden = true
            revealViewController().setFrontViewController(navCal, animated: true)
            revealViewController().setFrontViewPosition(FrontViewPosition.LeftSideMost, animated: true)
        }
        else if index.row == 2 {
            let ObjPrevious : MyPreviousBookingVC = MyPreviousBookingVC (nibName:"MyPreviousBookingVC",bundle:nil)
            let navCal : UINavigationController = UINavigationController(rootViewController:ObjPrevious)
            navCal.navigationBarHidden = true
            revealViewController().pushFrontViewController(navCal, animated: true)
            //revealViewController().setFrontViewController(contactObj, animated: true)
            revealViewController().setFrontViewPosition(FrontViewPosition.LeftSideMost, animated: true)
        }
        else if index.row == 3 {
            let ObjUpcomming : MyUpcomingBookingVC = MyUpcomingBookingVC (nibName:"MyUpcomingBookingVC",bundle:nil)
            revealViewController().pushFrontViewController(ObjUpcomming, animated: true)
            //revealViewController().setFrontViewController(contactObj, animated: true)
            revealViewController().setFrontViewPosition(FrontViewPosition.LeftSideMost, animated: true)
        }
        else if index.row == 4 {
            let ObjMoney : MyMoneyVC = MyMoneyVC (nibName:"MyMoneyVC",bundle:nil)
            revealViewController().pushFrontViewController(ObjMoney, animated: true)
            //revealViewController().setFrontViewController(contactObj, animated: true)
            revealViewController().setFrontViewPosition(FrontViewPosition.LeftSideMost, animated: true)
        }
        else if index.row == 5 {
            let objLocation : MyLocation2Other = MyLocation2Other (nibName:"MyLocation2Other",bundle:nil)
            let navCal : UINavigationController = UINavigationController(rootViewController:objLocation)
            navCal.navigationBarHidden = true
            revealViewController().pushFrontViewController(navCal, animated: true)
            //revealViewController().setFrontViewController(contactObj, animated: true)
            revealViewController().setFrontViewPosition(FrontViewPosition.LeftSideMost, animated: true)
        }
        else if index.row == 6 {
            let Objcontact : ContactVC = ContactVC (nibName:"ContactVC",bundle:nil)
            revealViewController().pushFrontViewController(Objcontact, animated: true)
            //revealViewController().setFrontViewController(contactObj, animated: true)
            revealViewController().setFrontViewPosition(FrontViewPosition.LeftSideMost, animated: true)
        }
        else if index.row == 7 {
            let ObjSetting : SettingVC = SettingVC (nibName:"SettingVC",bundle:nil)
            revealViewController().pushFrontViewController(ObjSetting, animated: true)
            //revealViewController().setFrontViewController(contactObj, animated: true)
            revealViewController().setFrontViewPosition(FrontViewPosition.LeftSideMost, animated: true)
        }
    }
    
    func didSelectedClientCell(index:NSIndexPath){
        if index.row == 0 {
            
            let ObjAddbooking : AddBookingVC = AddBookingVC (nibName:"AddBookingVC",bundle:nil)
            revealViewController().pushFrontViewController(ObjAddbooking, animated: true)
            revealViewController().setFrontViewPosition(FrontViewPosition.LeftSideMost, animated: true)
        }
        else if index.row == 1 {
            let ObjProfile : ProfileVC = ProfileVC (nibName:"ProfileVC",bundle:nil)
            revealViewController().pushFrontViewController(ObjProfile, animated: true)
            revealViewController().setFrontViewPosition(FrontViewPosition.LeftSideMost, animated: true)
        }
        else if index.row == 2 {
            let ObjAccount : SignUpSetp2 = SignUpSetp2 (nibName:"SignUpSetp2",bundle:nil)
            ObjAccount.is_AccountScreen = true
            let navCal : UINavigationController = UINavigationController(rootViewController:ObjAccount)
            navCal.navigationBarHidden = true
            revealViewController().setFrontViewController(navCal, animated: true)
            revealViewController().setFrontViewPosition(FrontViewPosition.LeftSideMost, animated: true)
        }
        /*else if index.row == 3 {
            let ObjPrevious : PreviousBookingClientVC = PreviousBookingClientVC (nibName:"PreviousBookingClientVC",bundle:nil)
            let navCal : UINavigationController = UINavigationController(rootViewController:ObjPrevious)
            navCal.navigationBarHidden = true
            revealViewController().pushFrontViewController(navCal, animated: true)
            revealViewController().setFrontViewPosition(FrontViewPosition.LeftSideMost, animated: true)
        }*/
        else if index.row == 3 {
            let ObjUpcomming : MyBookingVC = MyBookingVC (nibName:"MyBookingVC",bundle:nil)
            ObjUpcomming.strType = "0"
            revealViewController().pushFrontViewController(ObjUpcomming, animated: true)
            revealViewController().setFrontViewPosition(FrontViewPosition.LeftSideMost, animated: true)
        }
        else if index.row == 4 {
            let ObjSetting : SettingVC = SettingVC (nibName:"SettingVC",bundle:nil)
            revealViewController().pushFrontViewController(ObjSetting, animated: true)
            revealViewController().setFrontViewPosition(FrontViewPosition.LeftSideMost, animated: true)
        }
    }
    
    //MARK: TABLEVIEW CELL DATA METHOS
    ///  This is the Method for fill the **data** into the cell
    func aplyCellData(cell:SliderTableViewCell ,withIndex:Int) {
        let dict = arrMenu[withIndex] as! NSMutableDictionary
        cell.lblName.text = dict ["Title"] as? String
        cell.imgIcon.image = UIImage(named: (dict ["icon"] as? String)!)
    }
    
    func gotomoney(notification: NSNotification){
        let ObjMoney : MyMoneyVC = MyMoneyVC (nibName:"MyMoneyVC",bundle:nil)
        revealViewController().pushFrontViewController(ObjMoney, animated: false)
        revealViewController().setFrontViewPosition(FrontViewPosition.LeftSideMost, animated: false)
    }
    
    func gotoPrevious(notification: NSNotification){
        let ObjPrevious : MyPreviousBookingVC = MyPreviousBookingVC (nibName:"MyPreviousBookingVC",bundle:nil)
        let navCal : UINavigationController = UINavigationController(rootViewController:ObjPrevious)
        navCal.navigationBarHidden = true
        revealViewController().pushFrontViewController(navCal, animated: true)
        revealViewController().setFrontViewPosition(FrontViewPosition.LeftSideMost, animated: true)
    }
    
    func gotoUpcoming(notification: NSNotification){
        let ObjUpcomming : MyUpcomingBookingVC = MyUpcomingBookingVC (nibName:"MyUpcomingBookingVC",bundle:nil)
        revealViewController().pushFrontViewController(ObjUpcomming, animated: true)
        revealViewController().setFrontViewPosition(FrontViewPosition.LeftSideMost, animated: true)
    }
    func gotoUpcoming_bookings(notification: NSNotification){
        let ObjUpcomming : MyBookingVC = MyBookingVC (nibName:"MyBookingVC",bundle:nil)
        ObjUpcomming.strType = "2"
        revealViewController().pushFrontViewController(ObjUpcomming, animated: false)
        revealViewController().setFrontViewPosition(FrontViewPosition.LeftSideMost, animated: false)
    }
    func gotoTodays_bookings(notification: NSNotification){
        let ObjUpcomming : MyBookingVC = MyBookingVC (nibName:"MyBookingVC",bundle:nil)
        ObjUpcomming.strType = "1"
        revealViewController().pushFrontViewController(ObjUpcomming, animated: false)
        revealViewController().setFrontViewPosition(FrontViewPosition.LeftSideMost, animated: false)
    }
}
