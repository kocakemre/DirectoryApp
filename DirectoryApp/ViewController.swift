//
//  ViewController.swift
//  DirectoryApp
//
//  Created by Emre Kocak on 13.09.2022.
//
/*
 Rehber uygulaması yapılacaktır. Uygulama açılışında kayıtlı kişiler listelenecektir. Kişilerin ad soyad ve telefon bilgisi bulunacak olup başta da cinsiyetine göre profil iconu şeklinde resim görünecektir.
 
 En üstte yeni butonu olacak. Bu butona basıldığında yeni kişi kaydetme ekranı açılacaktır. Burada kişilerin ad, soyad, telefon ve cinsiyet bilgileri girilecektir. Kaydet butonuna basıldığında kişi listeye kaydedilip ana sayfadaki liste güncellenecektir.
 
 Eğer listedeki kişinin üzerine basılırsa yeni ekranının aynısı üzerine basılan kişinin bilgileri ile dolacak ve değiştirilmesi halinde güncelleme yapılacaktır. Güncelleme işleminde sadece telefon numarası güncellenebilecektir. Diğer alanların güncellenmesine izin verilmeyecektir. */

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI Elements
    
    @IBOutlet weak var tableViewList: UITableView!
    
    
    let manImage = UIImage(named: "man")
    let womanImage = UIImage(named: "woman")
    
    // MARK: - UI Elements
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewList.delegate = self
        tableViewList.dataSource = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableViewList.reloadData()
    }
    
    // MARK: - Prepare Functions
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let vc = segue.destination as! VC_PersonDetail
            vc.person = Globals.persons[sender as! Int]
        }
    }
    
}

// MARK: - Table View Extension

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  Globals.persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = Globals.persons[indexPath.row]
        
        let cell = Bundle.main.loadNibNamed("TableViewCell_Person", owner: self,options: nil)?.first as! TableViewCell_Person
        
        cell.imageViewGender.image = Gender.Man == .Man ? manImage : womanImage
        
        //        if person.gender == Gender.Man {
        //            cell.imageViewGender.image = manImage
        //        } else {
        //            cell.imageViewGender.image = womanImage
        //        }
        
        cell.labelNameSurname.text = person.name + " " + person.surname
        
        cell.labelNumber.text = person.number
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete
        {
            Globals.persons.remove(at: indexPath.row)
            tableViewList.reloadData()
        }
    }
    
    
}
