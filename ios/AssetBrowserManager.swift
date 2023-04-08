//
//  AssetBrowserManager.swift
//  ac-react-native-asset-broswer
//
//  Created by cyc on 2023/4/8.
//

import Foundation

import MTPhotoBroswer

@objc(AssetBrowserManager)
class AssetBrowserManager: NSObject {
    
    @objc(show:)
    func show(_ props: NSDictionary) {
        
        let urls = props["urls"]
        let index = Int(props["index"] as? String ?? "0") ?? 0
         guard let urlStrings = urls as? [String] else {
            return
        }
        let imageURLs = urlStrings.map {
            if FileManager.default.fileExists(atPath: $0) {
                return URL(fileURLWithPath: $0)
            } else {
                return URL(string: $0)!
            }
        }
        
        guard let vc = RCTPresentedViewController(), let supview = vc.view else {
            return
        }
        let photoBrowserVC = MTAssetBroswerViewController(imageURLs: imageURLs, index: index)
        photoBrowserVC.currentPage = index
        photoBrowserVC.presentingImageView = findReactNativeImageView(supview: supview, url: imageURLs[index].absoluteString)
        vc.present(photoBrowserVC, animated: false)
    }
    
    
    func findReactNativeImageView(supview: UIView, url: String) -> UIImageView? {

        // FIXME: 之后看有没有其他的方案去优化   bug触发条件为一个页面中有多个url一样的图片，点击多个图片，只会有一张图进行动画操作  一般默认当前页面的url只有一张图的url参数为一样， 这个方案由于时间比较赶   项目源码需要更进一步深入
        
        
        if let imageSuperView = supview as? RCTImageView {
            let isSameURL = url == imageSuperView.imageSources.first?.request.url?.absoluteString
            if isSameURL, let imageView = imageSuperView.subviews.first as? RCTUIImageViewAnimated {
                return imageView
            }
        } else {
            for subview in supview.subviews {
                let subImageView = findReactNativeImageView(supview: subview, url: url)
                if subImageView != nil {
                    return subImageView
                }
            }
        }
        return nil
    }
    
    
}
