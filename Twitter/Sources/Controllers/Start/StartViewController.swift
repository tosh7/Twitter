import UIKit

final class StartViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        apiClient.getTweet(.init(tweetId: "1548894115257282560")) { result in
            switch result {
            case let .success(result):
                print(result)
            case let .failure(error):
                print(error)
            }
        }

        apiClient.getTimeline(.init()) { result in
            switch result {
            case let .success(result):
                print(result)
            case let .failure(error):
                print(error)
            }
        }
    }
}
