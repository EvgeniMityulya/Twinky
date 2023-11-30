//
//  SettingsViewController.swift
//  Twinky
//
//  Created by Admin on 29.11.23.
//

import UIKit
import SnapKit

protocol SettingsViewInput: AnyObject {
    func configureUI()
    func presentViewController(withViewController viewController: UIViewController)
}

final class SettingsViewController: UIViewController {
    var output: SettingsViewOutput?
    
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Settings"
        lbl.font = UIFont.sourceSans(ofSize: 32, style: .bold)
        lbl.textColor = .titleColor
        return lbl
    }()
    
    private lazy var tableProfileView: UITableView = {
        
        let tv = UITableView(frame: .zero, style: .insetGrouped)
        tv.delegate = self
        tv.dataSource = self
        tv.register(SettingsProfileTableCell.self, forCellReuseIdentifier: SettingsProfileTableCell.identifier)
        tv.isScrollEnabled = false
        tv.separatorStyle = .none
        tv.backgroundColor = .clear
        tv.tag = 0
        return tv
    }()
    
    private lazy var tableSettingsView: UITableView = {
        
        let tv = UITableView(frame: .zero, style: .insetGrouped)
        tv.delegate = self
        tv.dataSource = self
        tv.register(SettingsOptionsTableCell.self, forCellReuseIdentifier: SettingsOptionsTableCell.identifier)
        tv.isScrollEnabled = false
        tv.separatorStyle = .none
        tv.separatorColor = .gray
        tv.backgroundColor = .clear
        tv.tag = 1
        return tv
    }()
    
    private let signOutButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .backgroundViewSecondary
        btn.layer.cornerRadius = 24
        btn.titleLabel?.font = UIFont.sourceSans(ofSize: 16, style: .bold)
        btn.setTitle("Sign Out", for: .normal)
        btn.setTitleColor(.backgroundView, for: .normal)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
    }
}

extension SettingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let viewController = self.output?.getPresentedViewController(
            forTag: tableView.tag,
            forIndex: indexPath.row
        ) else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if tableView.tag == 0 {
            return 88.0
        }
        
        return 72.0
    }
}

extension SettingsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView.tag == 0 {
            return 1
        }
        else if tableView.tag == 1 {
            return SettingsViewsContent.settingsTitles.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView.tag == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsOptionsTableCell.identifier) as? SettingsOptionsTableCell else { return UITableViewCell() }
            
            cell.configure(withContent: SettingsViewsContent.settingsTitles[indexPath.row])
            configureCellView(forCell: cell)
            return cell
        }
        else if tableView.tag == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsProfileTableCell.identifier) as? SettingsProfileTableCell else { return UITableViewCell() }
            
            cell.configure()
            configureCellView(forCell: cell)
            return cell
        }
        
        return UITableViewCell()
    }
    
    func configureCellView(forCell cell: UITableViewCell) {
        cell.accessoryType = .disclosureIndicator
        cell.layer.borderWidth = 0.3
        cell.layer.borderColor = UIColor.separatorColor.cgColor
        cell.selectionStyle = .gray
    }
    
    @objc func signOutButtonTapped() {
        print("Sign Out!")
    }
}

extension SettingsViewController: SettingsViewInput {
    func presentViewController(withViewController viewController: UIViewController) {
        self.navigationController?.present(viewController, animated: true)
    }
    
    
    func configureUI() {
        
        view.backgroundColor = .backgroundViewColor
        view.addSubview(titleLabel)
        view.addSubview(tableProfileView)
        view.addSubview(tableSettingsView)
        
        signOutButton.addTarget(self, action: #selector(signOutButtonTapped), for: .touchUpInside)
        view.addSubview(signOutButton)
        
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(20)
            $0.top.equalTo(60)
        }
        
        tableProfileView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).inset(20)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(tableSettingsView).offset(100)
        }
        
        tableSettingsView.snp.makeConstraints(){
            $0.top.equalTo(100).offset(188)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(330)
        }
        
        signOutButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(120)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(56)
            $0.width.equalTo(340)
        }
    }
}
