//
//  EventsViewController.swift
//  DuppizleTest
//
//  Created by Tariq Maged on 13/11/2021.
//

import UIKit
import Combine

class EventsViewController: UIViewController {
    
    //outlets
    @IBOutlet weak var titleView: RoundedShadowView!
    @IBOutlet weak var btnSearch: ButtonRounded!
    @IBOutlet weak var txtFiedSerch: CustomTextField!
    @IBOutlet weak var eventTableView: TanibleView!
    
    //vars
    var eventViewModel = EventViewModel()
    private var cancelable = Set<AnyCancellable>()
    var eventModel:EventModel?{
        didSet{
            if let eventArr = eventModel?.events ,eventArr.isEmpty {
                self.alertUser(message: "No Data Found for Your Search.")
            }
            eventTableView.reloadData()
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        searchByViewModel(queryValue:"Texas+Ranger")
    }
    
    func setupViews(){
        let taxonNib = UINib(nibName: "EventCell", bundle: nil)
        eventTableView.register(taxonNib, forCellReuseIdentifier: "EventCell")
        eventTableView.direction = .right
        eventTableView.delegate = self
        eventTableView.dataSource = self
        eventTableView.tableFooterView = UIView()
        btnSearch.addTarget(self, action: #selector(btnSearcPressed), for: .touchUpInside)
        txtFiedSerch.delegate = self
        titleView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endEditing)))
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        eventTableView.reloadData()
    }
    
    func searchByViewModel(queryValue:String) {
        eventViewModel.fetchEvents(queryValue:queryValue)
        eventViewModel.$eventModel
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] event in
                self?.eventModel = event
            })
            .store(in: &cancelable)
        
        let stateValueHandler: (EventViewModelState) -> Void = { [weak self] state in
            switch state {
            case .loading:
                self?.shouldPresentLoadingView(true)
            case .finishedLoading:
                self?.shouldPresentLoadingView(false)
            case .error:
                self?.shouldPresentLoadingView(false)
                self?.alertUser(message: "Error Occured")
            }
        }
        
        eventViewModel.$state
            .receive(on: RunLoop.main)
            .sink(receiveValue: stateValueHandler)
            .store(in: &cancelable)
    }

    @objc func btnSearcPressed(){
        guard let serchQuary = txtFiedSerch.text else {return}
        endEditing()
        searchByViewModel(queryValue:serchQuary)
    }
    
    @objc func endEditing(){
        view.endEditing(true)
    }
    
    @IBAction func txtFieldChanged(_ sender: CustomTextField) {
        let isActive = (sender.text?.count ?? 0 > 1)
        btnSearch.isEnabled = isActive
        btnSearch.fadeTo(alphaValue: isActive ? 1:0.7, withDuration: 0.7)
    }
}

extension EventsViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventModel?.events?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventCell
        cell.delegate = self
        cell.setupCell(event: eventModel?.events?[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        endEditing()
        if let eventDetailVc = storyboard?.instantiateViewController(withIdentifier: "EventDetailsVC") as? EventDetailsVC{
            eventDetailVc.event = eventModel?.events?[indexPath.row]
           presentDetail(eventDetailVc)
    }
}
 
}


extension EventsViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        btnSearcPressed()
        return true
    }
}

extension EventsViewController:EventCellDelegate{
    func handleFevoriteEvent(id: Int) {
        if Constants.fevoriteArr.contains(id){
            Constants.fevoriteArr = Constants.fevoriteArr.filter{$0 != id}
        }else{
            Constants.fevoriteArr.append(id)
        }
        eventTableView.reloadData()
    }
}
