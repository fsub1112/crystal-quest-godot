# 📥 Automated Asset Download Instructions

This project includes **automated downloaders** to get all free CC0 game assets with one command!

## 🚀 Quick Start

### **Windows Users:**

1. **Double-click** `download_assets.bat`
2. Wait for downloads to complete
3. Follow on-screen instructions for manual downloads

### **Linux/Mac Users:**

```bash
# Make script executable
chmod +x download_assets.sh

# Run the downloader
./download_assets.sh
```

### **Python (All Platforms):**

```bash
# Install requirements
pip install requests

# Run downloader
python download_assets.py
```

---

## 📦 What Gets Downloaded Automatically

The script automatically downloads these **CC0/Public Domain** assets:

✅ **Kenney Dungeon Kit** (~50MB)
- Floors, walls, doors, pillars
- Torches and props
- Stone textures

✅ **Kenney Platformer Kit** (~30MB)
- Platform blocks
- Bridges and ramps
- Collectible items

✅ **Kenney UI Pack** (~5MB)
- Buttons and panels
- Health bars
- Icons

✅ **Kenney Impact Sounds** (~10MB)
- Attack sounds
- Footsteps
- Collection sounds

**Total automatic downloads: ~95MB**

---

## 🖱️ Manual Downloads Required

These assets don't have direct download links and must be downloaded manually:

### **1. Player Character (Quaternius)**

**Pack:** Ultimate Animated Character Pack  
**Link:** [https://quaternius.com/packs/ultimateanimatedcharacter.html](https://quaternius.com/packs/ultimateanimatedcharacter.html)  
**Size:** ~50MB

**Steps:**
1. Click the link above
2. Click the green **"Download"** button
3. Extract the ZIP file
4. Copy all `.glb` files from `GLTF/` folder
5. Paste into `assets/models/player/`

**What's included:** 120+ animations (walk, run, jump, attack, idle, death)

---

### **2. Enemy Characters (Quaternius)**

**Pack:** Fantasy Kingdom Pack  
**Link:** [https://quaternius.com/packs/fantasykingdom.html](https://quaternius.com/packs/fantasykingdom.html)  
**Size:** ~40MB

**Steps:**
1. Visit the link
2. Download the pack
3. Extract and find enemy models (skeleton, goblin, orc)
4. Copy `.glb` files to `assets/models/enemies/`

**What's included:** Rigged enemies with attack/walk/idle animations

---

## ⚙️ Troubleshooting

### **"Python not found" Error (Windows)**

1. Install Python from: [https://www.python.org/downloads/](https://www.python.org/downloads/)
2. ✅ Check **"Add Python to PATH"** during installation
3. Restart your computer
4. Run the script again

### **"requests module not found" Error**

```bash
pip install requests
```

Or the script will attempt to install it automatically.

### **"Permission denied" Error (Linux/Mac)**

```bash
chmod +x download_assets.sh
```

### **Download Stuck or Slow?**

- Check your internet connection
- Try downloading one pack at a time manually
- Use [Kenney All-in-One Pack](https://kenney.itch.io/kenney-game-assets) (pay-what-you-want)

### **Extraction Failed?**

- Ensure you have enough disk space (~500MB free)
- Try extracting manually with WinRAR/7-Zip
- Check antivirus isn't blocking the script

---

## 📂 Expected Folder Structure After Download

```
crystal-quest-godot/
├── assets/
│   ├── models/
│   │   ├── player/
│   │   │   └── (Quaternius character .glb files - MANUAL)
│   │   ├── enemies/
│   │   │   └── (Quaternius enemy .glb files - MANUAL)
│   │   └── environment/
│   │       ├── dungeon/         ✅ Auto-downloaded
│   │       └── platformer/      ✅ Auto-downloaded
│   ├── ui/                      ✅ Auto-downloaded
│   └── audio/
│       └── sfx/                 ✅ Auto-downloaded
└── ...
```

---

## 🔒 License & Legal

All downloaded assets are:

✅ **CC0/Public Domain** - No attribution required  
✅ **Commercial use allowed** - Use in paid games  
✅ **No royalties** - 100% free forever  
✅ **Modification allowed** - Edit as needed

**Sources:**
- [Kenney.nl](https://kenney.nl/) - CC0 License
- [Quaternius.com](https://quaternius.com/) - Public Domain

---

## ⏱️ Download Time Estimates

| Connection Speed | Automatic Downloads | Manual Downloads | Total |
|------------------|---------------------|------------------|-------|
| **Fast (50+ Mbps)** | 2-3 minutes | 1-2 minutes | ~5 min |
| **Medium (10-50 Mbps)** | 5-10 minutes | 3-5 minutes | ~15 min |
| **Slow (<10 Mbps)** | 15-30 minutes | 10-15 minutes | ~45 min |

---

## ✅ Verification Checklist

After running the downloader, verify:

- [ ] `assets/models/environment/dungeon/` contains .glb files
- [ ] `assets/models/environment/platformer/` contains .glb files
- [ ] `assets/ui/` contains .png files
- [ ] `assets/audio/sfx/` contains .wav or .ogg files
- [ ] `assets/models/player/` contains Quaternius character (manual)
- [ ] `assets/models/enemies/` contains enemy models (manual)

---

## 🆘 Still Having Issues?

1. **Check the main README.md** for manual download links
2. **Read ASSET_DOWNLOAD_GUIDE.md** for detailed instructions
3. **Open an issue** on GitHub with error messages
4. **Skip automatic download** and download manually from:
   - [Kenney Assets](https://kenney.nl/assets)
   - [Quaternius Packs](https://quaternius.com/)

---

## 🎉 Next Steps

Once all assets are downloaded:

1. ✅ Open project in **Godot 4.5.1**
2. ⏳ Wait for assets to import (2-5 minutes)
3. 📖 Follow **SCENE_SETUP_GUIDE.md**
4. 🎮 Build your game!

---

**Happy downloading! 🚀**
