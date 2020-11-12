//  Created by Tymoteusz Stokarski on 04/11/2020.
//

import SwiftUI
import Lottie

struct LottieAnimationView: UIViewRepresentable {
    
    let animationView = AnimationView()
    var lottieAnimationName: String
    
    init(_ animation: LottieAnimationName) {
        self.lottieAnimationName = animation.rawValue
    }
    
    func makeUIView(context: UIViewRepresentableContext<LottieAnimationView>) -> some UIView {
        let view = UIView()
        let animation = Animation.named(lottieAnimationName)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .loop
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        view.backgroundColor = .clear
        
        NSLayoutConstraint.activate( [
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<LottieAnimationView>) {
        
    }
    
}

enum LottieAnimationName: String {
    
    case checkList = "animation1"
    
}
