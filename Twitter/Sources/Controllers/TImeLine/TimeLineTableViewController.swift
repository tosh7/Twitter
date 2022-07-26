import UIKit

class TimeLineTableViewController: UITableViewController {

    init() {
        super.init(nibName: nil, bundle: nil)

        print("TimelineTVC")
    }

    required init?(coder: NSCoder) { fatalError() }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TimeLineTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "TweetCell")
        tableView.rowHeight = 166
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell") as! TimeLineTableViewCell
        return cell
    }
}
