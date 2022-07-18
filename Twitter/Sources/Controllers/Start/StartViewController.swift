import UIKit

final class StartViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        Task {
            let tweets = await apiClient.getTweet(.init(tweetId: "1548894115257282560"))
            print(tweets)

            let timeline = await apiClient.getTimeline(.init())
            print(timeline)
        }
    }
}
