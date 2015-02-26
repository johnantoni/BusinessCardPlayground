// Playground - noun: a place where people can play

import UIKit

class BusinessCard: UIView {
    var lblName = UILabel()
    var lblPosition = UILabel()
    var spacer = UIView()
    var defaultColor = UIColor.lightGrayColor()

    func setFontSize() {
        // set label sizing
        let h1 = self.bounds.height / 6
        let h2 = self.bounds.height / 8
        self.lblName.font = UIFont.boldSystemFontOfSize(h1)
        self.lblPosition.font = UIFont.boldSystemFontOfSize(h2)
    }
    
    func setDetails(fullname: String, cardPos: String) {
        // update labels
        self.lblName.text = fullname
        self.lblPosition.text = cardPos

        // set text styling
        self.setFontSize()
        
        // add labels to view
        self.addSubview(self.lblName)
        self.addSubview(self.lblPosition)
        
        let bounds = self.bounds

        // update label dimensions to fit
        self.lblName.sizeToFit()
        self.lblPosition.sizeToFit()

        // position labels to right
        var rect = self.lblName.frame
        rect.origin.x = self.bounds.width / 2
        rect.origin.y = 20.0
        self.lblName.frame = rect
        
        rect.origin.y += rect.size.height
        self.lblPosition.frame = rect
    }
    
    func setImage(webUrl: String) {
        // get image
        let url = NSURL(string: webUrl)!
        let data = NSData(contentsOfURL: url)!
        let image = UIImage(data: data)
        var imageView = UIImageView(image: image)

        // scale image
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        imageView.clipsToBounds = true
        
        // position image
        imageView.frame = CGRect(
            x: 0,
            y: 10,
            width: (self.bounds.width / 2) - 0,
            height: (self.bounds.height) - 20)
        
        // add image to view
        self.addSubview(imageView)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // set initial background color
        self.backgroundColor = defaultColor;
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

var view = BusinessCard(frame: CGRectMake(0, 0, 840, 320))

view.setDetails("Jack Torrance", cardPos: "Caretaker")
view.setImage("http://placekitten.com/240/320")

view
