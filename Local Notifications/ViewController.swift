//
//  ViewController.swift
//  Local Notifications
//
//  Created by 라완 💕 on 04/05/1444 AH.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let pickerData = ["5 Minutes", "10 Minutes", "20 Minutes", "30 Minutes"]
    
    var select = String()
    var history : [String] = []
    var textOne: String = String()
    var textTow: String = String()
    var num: Int = Int()
    var textList = 0
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        select = pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        NSAttributedString(string: pickerData[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    
    @IBOutlet weak var llabelOne: UILabel!
    @IBOutlet weak var llabelTow: UILabel!
    @IBOutlet weak var llabelThree: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var llabelFour: UILabel!
    @IBOutlet weak var buttonSttart: UIButton!
    @IBOutlet weak var llabelFive: UILabel!
    
    @IBAction func buttonStart(_ sender: UIButton) {
      
        timer()
        let alertController = UIAlertController(title: "\(self.select) countdown", message: "After \(self.select), you'll be notified.\n Turn your ringer on", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil ))
        present(alertController, animated: true , completion: nil)
        num = 0
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge])
        {granted, error in
            if granted{
                print("granted")
                DispatchQueue.main.async {
                    self.scheduleNotifcation()
                }
               
            }else{
                print("denied")
            }
        }

    }
    
    func scheduleNotifcation(){
        let content = UNMutableNotificationContent()
        content.title = "Timer Ended!!"
        content.body = "\(self.select) is over"
        content.sound = .default
        content.badge = 1
        if self.select == self.pickerData[0] {
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(5 * 60), repeats: false)
            let request = UNNotificationRequest(identifier: "Timer", content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request)
        }else if self.select == self.pickerData[1] {
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(10 * 60), repeats: false)
            let request = UNNotificationRequest(identifier: "Timer", content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request)
        }else if self.select == self.pickerData[2] {
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(20 * 60), repeats: false)
            let request = UNNotificationRequest(identifier: "Timer", content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request)
        }else if self.select == self.pickerData[3] {
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(30 * 60), repeats: false)
            let request = UNNotificationRequest(identifier: "Timer", content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request)
        }
       
        
    }
    func timer() {
        let time = Date()
        let five = time.addingTimeInterval(Double(5) * 60)
        let ten = time.addingTimeInterval(Double(10) * 60)
        let twenty = time.addingTimeInterval(Double(20) * 60)
        let thirty = time.addingTimeInterval(Double(30) * 60)
        let format = DateFormatter()
        format.dateFormat = "hh:mm a"
        
                    if self.select == "5 Minutes" {
                        self.llabelOne.text = "Total Time: 5"
                        self.llabelTow.text = "\(0) hours, 5 min"
                      
                        self.llabelFour.text = "Work Until: \(format.string(from: five))"
                    }else if self.select == "10 Minutes" {
                        self.llabelOne.text = "Total Time: 10"
                        self.llabelTow.text = "\(0) hours, 10 min"
                        
                        self.llabelFour.text = "Work Until: \(format.string(from: ten))"
                    }else if self.select == "20 Minutes" {
                        self.llabelOne.text = "Total Time: 20"
                        self.llabelTow.text = "\(0) hours, 20 min"
                        
                        self.llabelFour.text = "Work Until: \(format.string(from: twenty))"
                    }else if self.select == "30 Minutes" {
                        self.llabelOne.text = "Total Time: 30"
                        self.llabelTow.text = "\(0) hours, 30 min"
                        
                        self.llabelFour.text = "Work Until: \(format.string(from: thirty))"
                    }
        textTow = "\(self.select) timer set\n"
        llabelThree.text = textTow
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        llabelOne.text = "Total Time: \(0)"
        llabelTow.text = "\(0) hours, \(0) min"
        llabelThree.text = ""
        llabelFour.text = ""
        llabelFive.text = ""
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonOne(_ sender: UIButton) {
        
        switch(textList) {
        case 0:
            let time = Date()
            let five = time.addingTimeInterval(Double(5) * 60)
            let ten = time.addingTimeInterval(Double(10) * 60)
            let twenty = time.addingTimeInterval(Double(20) * 60)
            let thirty = time.addingTimeInterval(Double(30) * 60)
            let format = DateFormatter()
            format.dateFormat = "hh:mm a"
            if self.select == "5 Minutes" {
                self.llabelOne.text = "Total Time: 5"
                self.llabelTow.text = "\(0) hours, 5 min"
            }else if self.select == "10 Minutes" {
                self.llabelOne.text = "Total Time: 10"
                self.llabelTow.text = "\(0) hours, 10 min"
            }else if self.select == "20 Minutes" {
                self.llabelOne.text = "Total Time: 20"
                self.llabelTow.text = "\(0) hours, 20 min"
            }else if self.select == "30 Minutes" {
                self.llabelOne.text = "Total Time: 30"
                self.llabelTow.text = "\(0) hours, 30 min"
            }
            if self.select == "5 Minutes" {
                if num == 0 {
                    llabelFive.text = "\(format.string(from: time)) - \(format.string(from: five)) ... \(textTow)"
                    history.append(llabelFive.text!)
                }else{
                    self.llabelFive.text = "\(textOne)"
                    history.append(llabelFive.text!)
                }
            }
            else if self.select == "10 Minutes" {
                if num == 0 {
                    llabelFive.text = "\(format.string(from: time)) - \(format.string(from: ten)) ... \(textTow)"
                    history.append(llabelFive.text!)
                }else{
                    self.llabelFive.text = "\(textOne)"
                    history.append(llabelFive.text!)
                }
    
            }
            else if self.select == "20 Minutes" {
                if num == 0 {
                    llabelFive.text = "\(format.string(from: time)) - \(format.string(from: twenty)) ... \(textTow)"
                    history.append(llabelFive.text!)
                }else{
                    self.llabelFive.text = "\(textOne)"
                    history.append(llabelFive.text!)
                }
            }
            else if self.select == "30 Minutes" {
                if num == 0 {
                    llabelFive.text = "\(format.string(from: time)) - \(format.string(from: thirty)) ... \(textTow)"
                    history.append(llabelFive.text!)
                }else{
                    self.llabelFive.text = "\(textOne)"
                    history.append(llabelFive.text!)
                }
            }
                for _ in 0...history.count-1 {

                    llabelFive.text = "\(history.joined(separator: " "))"
                }
                llabelFive.isHidden = false
                picker.isHidden = true
                llabelThree.isHidden = true
                llabelFour.isHidden = true
                buttonSttart.isHidden = true
                textList += 1
            
        case 1:
            picker.isHidden = false
            llabelFour.isHidden = false
            llabelThree.isHidden = false
            llabelFive.isHidden = true
            buttonSttart.isHidden = false
            timer()
            textList -= 1
        default:
            break
        }
        
    }
    
    
    @IBAction func buttonNew(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Are you sure it's a new day?", message: "", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .default, handler: {action in
            //print("Cancel")
           
            
        }))
        
        alertController.addAction(UIAlertAction(title: "New Day", style: .destructive, handler:{ [self] action in
            self.llabelOne.text = "Total Time: \(0)"
            self.llabelTow.text = ""
            self.llabelThree.text = ""
            self.llabelFour.text = ""
            let timerNotify = UNUserNotificationCenter.current()
                    timerNotify.removeDeliveredNotifications(withIdentifiers: ["Timer"])
                    timerNotify.removePendingNotificationRequests(withIdentifiers: ["Timer"])
            
        }))
        self.present(alertController, animated: true)
    }
    
    @IBAction func buttonReplay(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Cancel current timer?", message: "", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Back", style: .default, handler: {action in
           // print("back")
            
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler:{ [self] action in
            self.llabelOne.text = "Total Time: \(0)"
            self.llabelTow.text = "\(0) hours, \(0) min"
            self.llabelFour.text = ""
            let timerNotify = UNUserNotificationCenter.current()
                    timerNotify.removeDeliveredNotifications(withIdentifiers: ["Timer"])
                    timerNotify.removePendingNotificationRequests(withIdentifiers: ["Timer"])
           
            if self.select == "5 Minutes" {
                self.llabelThree.text = "5 Minute Timer Canceled"
            }else if self.select == "10 Minutes" {
                self.llabelThree.text = "10 Minute Timer Canceled"
            }else if self.select == "20 Minutes" {
                self.llabelThree.text = "20 Minute Timer Canceled"
            }else if self.select == "30 Minutes" {
                self.llabelThree.text = "30 Minute Timer Canceled"
            }
            self.num = 1
            self.textOne = "CANSELED ABOVE LISTING\n"
            //buttonSttart.isHidden = false
            //picker.isHidden = false
        }))
        self.present(alertController, animated: true)
        
    }
}
    
    


