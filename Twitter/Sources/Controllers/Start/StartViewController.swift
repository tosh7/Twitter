import UIKit
import SnapKit

final class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(loginWithTwitterButton)

        loginWithTwitterButton.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.equalTo(50)
            $0.width.equalTo(200)
        }

        Task {
//            let tweets = await apiClient.getTweet(.init(tweetId: "1548894115257282560"))
//            print(tweets)

//            let timeline = await apiClient.getTimeline(.init())
//            print(timeline)

            let user = await apiClient.getUser(.init(username: "tosh_3"))
            print(user)
        }
    }

    private lazy var loginWithTwitterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login with Twitter", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(loginButtonDidTapped), for: .touchUpInside)
        return button
    }()

    @objc func loginButtonDidTapped() {
        guard let url = URL(string: "") else { return }

        UIApplication.shared.open(url)
    }
}
