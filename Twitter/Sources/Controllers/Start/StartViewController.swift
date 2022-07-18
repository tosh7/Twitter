import UIKit

final class StartViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        apiClient.getTweet(tweetId: "1548894115257282560", completion: { result in
            switch result {
            case let .success(result):
                print(result)
            case let .failure(error):
                print(error)
            }
        })

        apiClient.getTimeline(completion: { result in
            switch result {
            case let .success(result):
                print(result)
            case let .failure(error):
                print(error)
            }
        })
    }
}
