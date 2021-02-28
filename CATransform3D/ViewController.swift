//
//  ViewController.swift
//  CATransform3D
//
//  Created by Emilio Del Castillo on 28/02/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var coordinates: [UILabel]!
    @IBOutlet weak var testImage: UIImageView!
    @IBOutlet weak var slider: UISlider!
    
    private var selected = 11
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for label in coordinates {
            let tap = UITapGestureRecognizer(target: self, action: #selector(selectCoordinate(sender:)))
            label.addGestureRecognizer(tap)
        }
        updateLabels()
            
    }

    private func updateLabels() {
        let transform = testImage.transform3D
        for label in coordinates {
            if label.tag == selected {
                label.backgroundColor = .green
            } else {
                label.backgroundColor = .systemGray6
            }
            switch label.tag {
            case 11:
                label.text = transform.m11.description
            case 12:
                label.text = transform.m12.description
            case 13:
                label.text = transform.m13.description
            case 14:
                label.text = transform.m14.description
            case 21:
                label.text = transform.m21.description
            case 22:
                label.text = transform.m22.description
            case 23:
                label.text = transform.m23.description
            case 24:
                label.text = transform.m24.description
            case 31:
                label.text = transform.m31.description
            case 32:
                label.text = transform.m32.description
            case 33:
                label.text = transform.m33.description
            case 34:
                label.text = transform.m34.description
            case 41:
                label.text = transform.m41.description
            case 42:
                label.text = transform.m42.description
            case 43:
                label.text = transform.m43.description
            case 44:
                label.text = transform.m44.description
            default:
                label.text = "?"
            }
        }
    }

    
    @IBAction func setMatrixCoordinate(_ sender: UISlider) {
        applyToMatrix(value: CGFloat(sender.value))
    }
    
    private func applyToMatrix (value: CGFloat) {
        var transform = testImage.transform3D
        switch selected {
        case 11:
            transform.m11 = value
        case 12:
            transform.m12 = value
        case 13:
            transform.m13 = value
        case 14:
            transform.m14 = value / 100
        case 21:
            transform.m21 = value
        case 22:
            transform.m22 = value
        case 23:
            transform.m23 = value
        case 24:
            transform.m24 = value / 100
        case 31:
            transform.m31 = value
        case 32:
            transform.m32 = value
        case 33:
            transform.m33 = value
        case 34:
            transform.m34 = value
        case 41:
            transform.m41 = value * 3
        case 42:
            transform.m42 = value * 3
        case 43:
            transform.m43 = value
        case 44:
            transform.m44 = value
        default:
            print("Error")
        }
        testImage.transform3D = transform
        updateLabels()
    }
    
    @IBAction func resetSlider(_ sender: UIButton) {
        slider.value = 0
        applyToMatrix(value: 0)
        updateLabels()
    }
    
    @objc func selectCoordinate(sender: UITapGestureRecognizer){
        selected = sender.view!.tag
        
        if let label = sender.view as? UILabel {
            slider.value = Float(label.text!)!
        }
        updateLabels()
    }
    
    @IBAction func reset(_ sender: UIButton) {
        selected = 11
        testImage.transform3D = CATransform3DIdentity
        updateLabels()
    }
}

