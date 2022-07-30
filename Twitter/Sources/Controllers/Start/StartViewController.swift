import UIKit
import SnapKit
import Combine

final class StartViewController: UIViewController {

    private var cancellables: Set<AnyCancellable> = []

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(loginWithTwitterButton)

        loginWithTwitterButton.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.equalTo(50)
            $0.width.equalTo(300)
        }

        NotificationCenter.default.publisher(for: .authSuccessed)
            .sink { [weak self] _ in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    let vc = TimelineTableViewController()
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }
            }
            .store(in: &cancellables)
    }

    private lazy var loginWithTwitterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login with Twitter", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(named: "Primary")
        button.addTarget(self, action: #selector(loginButtonDidTapped), for: .touchUpInside)
        return button
    }()

    @objc func loginButtonDidTapped() {
        let urlString = "https://twitter.com/i/oauth2/authorize?response_type=code&client_id=\(Contents.clientId)&redirect_uri=\(Contents.redirectURLString)&scope=tweet.read%20users.read%20offline.access&state=\(Contents.oath2State)&code_challenge=\(Contents.oauth2CodeChallenge)&code_challenge_method=plain"
        guard let url = URL(string: urlString) else { return }

        UIApplication.shared.open(url)
    }
}
