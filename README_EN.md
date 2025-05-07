# WhatsAppCleaner
![Badge](https://img.shields.io/badge/Windows-10%2B-0078D6?logo=windows&logoColor=white)
![Badge](https://img.shields.io/badge/License-MIT-green)

A simple utility to clean WhatsApp Desktop temporary files and reclaim disk space.

## 📋 Description

WhatsAppCleaner is a Windows batch script designed to clean accumulated temporary files from the WhatsApp Desktop application. Over time, WhatsApp stores large amounts of media files in its cache directory, occupying valuable disk space. This script automates the cleaning process to recover storage space.

## ✨ Features

- Automatically identifies WhatsApp's temporary storage directory
- Calculates and displays space occupied by temporary files (in MB/GB)
- Confirmation prompt before deletion
- Automatically closes WhatsApp before cleaning (if running)
- Reopens WhatsApp after cleanup (if previously running)
- Displays reclaimed space after cleanup

## 🚀 How to Use

1. Download [WhatsAppCleaner_EN.bat](https://raw.githubusercontent.com/suportefloripa/WhatsAppCleaner/main/WhatsAppCleaner_EN.bat)
2. Run by double-clicking or right-click and "Run as administrator"
3. The script will show space used by temporary files
4. Type `y` and press Enter to confirm cleanup, or `n` to cancel
5. If WhatsApp is running, it will close automatically before cleanup and reopen afterward

## ⚙️ How It Works

The script performs these steps:

1. Sets path to WhatsApp Desktop's temporary storage:
   ```
   %USERPROFILE%\AppData\Local\Packages\5319275A.WhatsAppDesktop_cv1g1gvanyjgm\LocalState\shared\transfers
   ```

2. Verifies directory existence

3. Checks if WhatsApp is running

4. Calculates temporary files size using PowerShell

5. Displays space usage and requests confirmation

6. If confirmed:
- Closes WhatsApp (if running)
- Removes all files and subdirectories
- Shows reclaimed space
- Reopens WhatsApp (if previously running)

## 📊 Technical Details

- Uses Windows commands and PowerShell for size calculations
- Employs UTF-8 encoding (code page 65001) for special characters
- Checks running processes to detect WhatsApp status
- Uses `whatsapp://` URI protocol to reopen the app

## ⚠️ Important Notes

- Works only with official Windows Store version of WhatsApp Desktop
- Recommended for periodic use to maintain disk space
- WhatsApp might take longer to load after first post-cleanup launch

## 🔄 Compatibility

- Windows 10/11
- WhatsApp Desktop (Microsoft Store version)

## 📜 License

This project is licensed under the MIT License - see [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions are welcome! Please feel free to open issues or submit pull requests.