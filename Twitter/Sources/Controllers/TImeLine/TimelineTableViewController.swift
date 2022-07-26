import UIKit

final class TimelineTableViewController: UIViewController {

    private var tableView: UITableView = UITableView() {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(UINib(nibName: "TimeLineTableViewCell", bundle: nil),
                               forCellReuseIdentifier: "TweetCell")
            tableView.rowHeight = 166
        }
    }
    private var tweets: [Timelines.TweetData] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    init() {
        super.init(nibName: nil, bundle: nil)

        view.addSubview(tableView)

        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        Task { @MainActor in
            let result = await apiClient.getTimeline(.init())
            switch result {
            case .success(let timeline):
                self.tweets = timeline.data
            case .failure(_):
                break
            }
        }
    }

    required init?(coder: NSCoder) { fatalError() }
}

extension TimelineTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell") as! TimeLineTableViewCell
        cell.setup(tweet: tweets[indexPath.row])
        return cell
    }
}

extension TimelineTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 166
    }
}
