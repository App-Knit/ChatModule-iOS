//
//  ExtensionHelper.swift
//  Saini
//
//  Created by Rohit Saini on 05/07/18.
//  Copyright © 2018 SainiSaab. All rights reserved.
//

import UIKit

class ExtensionHelper: NSObject {
    
}

extension UIButton{
    
    func btn_border (){
        layer.borderWidth = 0.3
        layer.borderColor = UIColor .black.cgColor
    }
    
    func borderColor(myView : UIButton) {
        layer.borderWidth = 1.0
        layer.borderColor = myView.titleLabel?.textColor.cgColor
        clipsToBounds = true
    }
    
    func roundCorner(){
        self.layer.cornerRadius = self.layer.frame.size.height / 2
        self.layer.masksToBounds = true
    }
    
    func roundCorner(value: CGFloat){
        self.layer.cornerRadius = value
        self.layer.masksToBounds = true
    }
    
    func cornerRadius(){
        layer.cornerRadius = 5.0
        clipsToBounds = true
    }
    
    func cornerRound(){
        layer.cornerRadius = 15.0
        clipsToBounds = true
    }
    
    
    func CellBtncornerRadius(){
        layer.cornerRadius = 20.0
        clipsToBounds = true
    }
    
    
}

extension UITextField{
    func cornerRadius(value: CGFloat){
        self.layer.cornerRadius = value
        self.layer.masksToBounds = true
    }
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    
    func setPlaceHolderColor(){
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedStringKey.foregroundColor : UIColor.black])
    }
    
    func txtFeildBottomBorder(myView : UITextField) {
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 0, y: myView.frame.size.height - width, width:  myView.frame.size.width, height: myView.frame.size.height)
        border.borderWidth = width
        layer.addSublayer(border)
        layer.masksToBounds = true
    }
    
    func txtFeildBorder (){
        layer.borderWidth = 1.0
        layer.borderColor = UIColor .lightGray.cgColor
    }
    func txtCornerRadius() {
        layer.cornerRadius = 5.0
    }
    
    func txtLeftPadding(myview : UITextField){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: myview.frame.height))
        myview.leftView = paddingView
        myview.leftViewMode = UITextFieldViewMode.always
    }
}

extension UITextView{
    
    func txtViewBorder (){
        layer.borderWidth = 1.0
        layer.borderColor = UIColor .lightGray.cgColor
    }
    func txtViewLeftPadding(myview : UITextView){
        myview.contentInset = UIEdgeInsetsMake(8,8,0,0);
        myview.textAlignment = .left;
    }
    
}

extension UIView{
    
    func viewborder() {
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.lightGray.cgColor
    }
    
}

extension UILabel{
    func lblBorderRadius(myview : UILabel) {
        layer.borderColor = myview.textColor.cgColor
        layer.borderWidth = 2.0
        layer.cornerRadius = myview.frame.width/2
    }
    func lblBorderwithText(myview : UILabel) {
        layer.borderColor = myview.textColor.cgColor
        layer.borderWidth = 2.0
        layer.cornerRadius = 10.0
    }
    
    func CornerRadius(label : UILabel){
        label.layer.borderWidth = 1
        label.layer.masksToBounds = false
        label.layer.borderColor = UIColor.clear.cgColor
        label.layer.cornerRadius = label.frame.height/2
        label.clipsToBounds = true
    }
}

extension UISegmentedControl{
    func removeBorder(){
        let backgroundImage = UIImage.getColoredRectImageWith(color: UIColor.white.cgColor, andSize: self.bounds.size)
        let backgroundImage1 = UIImage.getColoredRectImageWith(color: UIColor(red: 223.0/255.0, green: 229.0/255.0, blue: 233.0/255.0, alpha: 1.0).cgColor, andSize: self.bounds.size)
        self.setBackgroundImage(backgroundImage1, for: .normal, barMetrics: .default)
        self.setBackgroundImage(backgroundImage, for: .selected, barMetrics: .default)
        self.setBackgroundImage(backgroundImage, for: .highlighted, barMetrics: .default)
        
        let deviderImage = UIImage.getColoredRectImageWith(color: UIColor.white.cgColor, andSize: CGSize(width: 1.0, height: self.bounds.size.height))
        self.setDividerImage(deviderImage, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        self.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.black  , NSAttributedStringKey.font: UIFont(name: "OpenSans", size: 13.0)!], for: .normal)
        self.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor(red: 67/255, green: 70/255, blue: 198/255, alpha: 1.0), NSAttributedStringKey.font: UIFont(name: "OpenSans", size: 13.0)!], for: .selected)
    }
    
    func addUnderlineForSelectedSegment(){
        removeBorder()
        let underlineWidth: CGFloat = self.bounds.size.width / CGFloat(self.numberOfSegments)
        let underlineHeight: CGFloat = 2.0
        let underlineXPosition = CGFloat(selectedSegmentIndex * Int(underlineWidth))
        let underLineYPosition = self.bounds.size.height -  1.0
        let underlineFrame = CGRect(x: underlineXPosition, y: underLineYPosition, width: underlineWidth, height: underlineHeight)
        let underline = UIView(frame: underlineFrame)
        underline.backgroundColor = UIColor(red: 67/255, green: 70/255, blue: 198/255, alpha: 1.0)
        underline.tag = 1
        self.addSubview(underline)
    }
    
    func changeUnderlinePosition(){
        guard let underline = self.viewWithTag(1) else {return}
        let underlineFinalXPosition = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(selectedSegmentIndex)
        UIView.animate(withDuration: 0.1, animations: {
            underline.frame.origin.x = underlineFinalXPosition
        })
    }
}

extension UIImage{
    
    class func getColoredRectImageWith(color: CGColor, andSize size: CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let graphicsContext = UIGraphicsGetCurrentContext()
        graphicsContext?.setFillColor(color)
        let rectangle = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        graphicsContext?.fill(rectangle)
        let rectangleImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return rectangleImage!
    }
}

extension NSAttributedString {
    
    func height(containerWidth: CGFloat) -> CGFloat {
        let rect = self.boundingRect(with: CGSize.init(width: containerWidth, height: CGFloat.greatestFiniteMagnitude), options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
        return ceil(rect.size.height)
    }
    
    func width(containerHeight: CGFloat) -> CGFloat {
        let rect = self.boundingRect(with: CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: containerHeight), options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
        return ceil(rect.size.width)
    }
}
/////////********



extension UIImageView{
    func circleImage(){
        self.layer.cornerRadius = self.layer.frame.size.height / 2
        self.layer.masksToBounds = true
    }
    
    func roundCorner(value: CGFloat){
        self.layer.cornerRadius = value
        self.layer.masksToBounds = true
    }
    
    func applyBorder(width: CGFloat, borderColor: UIColor)
    {
        self.layer.borderWidth = width
        self.layer.borderColor = borderColor.cgColor
    }
    
    
}


//Enums
enum ViewControllerType {
    case welcome
    case conversations
}

enum PhotoSource {
    case library
    case camera
}

enum ShowExtraView {
    case contacts
    case profile
    case preview
    case map
}

enum MessageType {
    case photo
    case text
    case location
}

enum MessageOwner {
    case sender
    case receiver
}


extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    func addBackButton() {
        let btnLeftMenu: UIButton = UIButton()
        let image = #imageLiteral(resourceName: "back")
        btnLeftMenu.setImage(image, for: .normal)
        btnLeftMenu.sizeToFit()
        btnLeftMenu.addTarget(self, action: #selector(backButtonClick(sender:)), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: btnLeftMenu)
        self.navigationItem.leftBarButtonItem = barButton
    }
    
    @objc func backButtonClick(sender : UIButton) {
        self.navigationController?.popViewController(animated: true);
    }
    
    class func displaySpinner(onView : UIView) -> UIView {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.2)
        let ai = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
        //  ai.color = UIColor(red: 254/255, green: 131/255, blue: 81/255, alpha: 1.0)
        ai.color = UIColor.white
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        return spinnerView
    }
    
    class func removeSpinner(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
    
    
    
    //creating the Spinning View
    // let sv = UIViewController.displaySpinner(onView: self.view)
    //Removing the spinning view
    // UIViewController.removeSpinner(spinner: sv)
    
}




//extension String {
//    var html2AttributedString: NSAttributedString? {
//        do {
//            return try NSAttributedString(data: Data(utf8), options: [NSAttributedString.DocumentType: .html, NSCharacterEncodingDocumentAttribute: String.Encoding.utf8.rawValue], documentAttributes: nil)
//        } catch {
//            print("error:", error)
//            return nil
//        }
//    }
//    var html2String: String {
//        return html2AttributedString?.string ?? ""
//    }
//}



