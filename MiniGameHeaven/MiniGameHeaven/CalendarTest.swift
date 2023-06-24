//
//  CalendarTest.swift
//  MiniGameHeaven
//
//  Created by Andrew on 2023/06/23.
//

import UIKit

class CalenderTest: UIViewController {
    
    var selectedColor: String = ""
    var selectedDate: DateComponents?
    
    private let calender = {
        let calendarView = UICalendarView()
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        calendarView.calendar = Calendar(identifier: .gregorian)
        calendarView.locale = Locale(identifier: "ko_KR")
        calendarView.fontDesign = .monospaced
        calendarView.tintColor = .red
        return calendarView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        calender.delegate = self
        calender.selectionBehavior = UICalendarSelectionSingleDate(delegate: self)  // delegate = self와 같은 원리
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(calender)
        
        NSLayoutConstraint.activate([
            calender.topAnchor.constraint(equalTo: view.topAnchor),
            calender.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            calender.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            calender.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

// 날짜 한개만 선택하려면 UICalendarSelectionSingleDateDelegate 사용
extension CalenderTest: UICalendarSelectionSingleDateDelegate {
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        let sheet = UIAlertController(title: "색을 선택하세요!", message: nil, preferredStyle: .alert)
        sheet.addAction(UIAlertAction(title: "🔴", style: .default, handler: { [weak self] _ in
            guard let dateComponents = dateComponents else { return }
            
            self?.selectedColor = "🔴"
            self?.selectedDate = dateComponents
            self?.calender.reloadDecorations(forDateComponents: [dateComponents], animated: true)
            self?.dismiss(animated: true)
        }))
        sheet.addAction(UIAlertAction(title: "🔵", style: .default, handler: { [weak self] _ in
            guard let dateComponents = dateComponents else { return }
            
            self?.selectedColor = "🔵"
            self?.selectedDate = dateComponents
            self?.calender.reloadDecorations(forDateComponents: [dateComponents], animated: true)
            self?.dismiss(animated: true)
        }))
        sheet.addAction(UIAlertAction(title: "🟠", style: .default, handler: { [weak self] _ in
            guard let dateComponents = dateComponents else { return }
            
            self?.selectedColor = "🟠"
            self?.selectedDate = dateComponents
            self?.calender.reloadDecorations(forDateComponents: [dateComponents], animated: true)
            self?.dismiss(animated: true)
        }))
        present(sheet, animated: true)
    }
    
    // 날짜 선택시 해당 날짜 강조 표시
    func dateSelection(_ selection: UICalendarSelectionSingleDate, canSelectDate dateComponents: DateComponents?) -> Bool {
        return true
    }
    
}

// decoration 날짜를 꾸며줌
extension CalenderTest: UICalendarViewDelegate {
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        if dateComponents == selectedDate {
            return .customView {
                let label = UILabel()
                label.font = UIFont.systemFont(ofSize: 8)
                label.text = self.selectedColor
                return label
            }
        }
        return nil
    }
}
