//
//  EventCell.swift
//  BlackStoneTest
//
//  Created by Tariq Maged on 28/01/2022.
//

import UIKit

protocol EventCellDelegate {
    func handleFevoriteEvent(id:Int)
}
class EventCell: UITableViewCell {
    
    //vars
    var delegate:EventCellDelegate?
    var event:Events?
    
    //outlets
    @IBOutlet weak var btnFev: UIButton!
    @IBOutlet weak var eventImgView: CachedImageView!
    @IBOutlet weak var lblWhen: UILabel!
    @IBOutlet weak var lblWhere: UILabel!
    @IBOutlet weak var lblVsTeam: UILabel!
    @IBOutlet weak var lblTeam: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btnFev.addTarget(self, action: #selector(btnFeVPressed), for: .touchUpInside)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        delegate = nil
    }
 
    func setupCell(event:Events?){
        self.event = event
        eventImgView.loadImage(urlString:event?.performers?.first?.image ?? "" )
        let dateString = (event?.datetime_utc ?? "").convertDateString( fromFormat: "yyyy-MM-ddTHH:mm:ss a", toFormat: "dd/MM/YYYY HH:mm")
        lblWhen.text = dateString
        lblTeam.text = (event?.performers?.first?.name ?? "").capitalized
        lblVsTeam.text = (event?.performers?.last?.name ?? "").capitalized
        lblWhere.text = event?.venue?.name
        handleBtnFev()
    }
    
    func handleBtnFev(){
        if let eventID = event?.id{
            let isFev = Constants.fevoriteArr.contains(eventID)
            let img = isFev ? UIImage(systemName: "heart.fill"):UIImage(systemName: "heart")
            btnFev.setImage(img, for: .normal)
        }
    }
    
    @objc func btnFeVPressed(){
        if let eventID = event?.id{
            delegate?.handleFevoriteEvent(id: eventID)
        }
    }
}
