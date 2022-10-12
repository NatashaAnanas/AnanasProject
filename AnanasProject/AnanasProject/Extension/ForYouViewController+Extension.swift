//
//  For + Extension.swift
//  AnanasProject
//
//  Created by Анастасия Козлова on 12.10.2022.
//

import UIKit
/// Расширение для ForYouViewController подписываемся на делегаты
extension ForYouViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        self.iconImageView.image = image
        guard let imageData = image.pngData() else { return }
        saveUserDefaults(image: imageData)
        dismiss(animated: true)
    }
}

extension ForYouViewController: UINavigationControllerDelegate {
}
