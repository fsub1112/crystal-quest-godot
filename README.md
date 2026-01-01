# 🎮 Crystal Quest - Godot 4.5.1 3D Game

![Godot Engine](https://img.shields.io/badge/Godot-4.5.1-blue.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)
![Assets](https://img.shields.io/badge/Assets-CC0%2FPublic%20Domain-orange.svg)

A complete 3D action-adventure dungeon crawler built with Godot Engine 4.5.1 using **100% free, no-attribution-required (CC0/Public Domain) assets**.

## ⚡ **NEW: Automated Asset Downloader!**

**No more manual downloads!** We've added automated scripts to download all assets:

```bash
# Windows: Double-click
download_assets.bat

# Linux/Mac:
chmod +x download_assets.sh
./download_assets.sh

# Python (all platforms):
pip install requests
python download_assets.py
```

✅ Downloads **~95MB** of assets automatically  
✅ Only **2 manual downloads** required (Quaternius character packs)  
✅ Takes **5-10 minutes** total!

👉 **See [DOWNLOAD_INSTRUCTIONS.md](DOWNLOAD_INSTRUCTIONS.md) for details**

---

## 📋 Game Overview

**Genre:** 3D Action-Adventure / Dungeon Crawler  
**Core Mechanics:**
- Third-person character movement with mouse camera control
- Real-time combat system with attack animations
- Enemy AI with pathfinding, detection, and attack behaviors
- Crystal collection system
- Health and score tracking

**Target Platforms:** PC (Windows, Linux, Mac), Web (HTML5)

## 🎨 Features

✅ **Player Controller**
- WASD/Arrow key movement
- Mouse-look camera system
- Sprint, jump, and attack mechanics
- Animated character with smooth transitions

✅ **Enemy AI**
- State machine (Idle → Chase → Attack)
- NavigationAgent3D pathfinding
- Detection radius and attack range
- Death animations and health system

✅ **Game Systems**
- Health bar UI
- Crystal collection counter
- Collision detection and physics
- Respawn on death

✅ **Visuals**
- Low-poly 3D art style
- Dynamic lighting
- Particle effects ready
- Cohesive fantasy aesthetic

## 🚀 Quick Start (5 Minutes!)

### **Step 1: Clone Repository**
```bash
git clone https://github.com/fsub1112/crystal-quest-godot.git
cd crystal-quest-godot
```

### **Step 2: Auto-Download Assets** ⚡

**Windows:**
```cmd
double-click download_assets.bat
```

**Linux/Mac:**
```bash
chmod +x download_assets.sh
./download_assets.sh
```

**Or use Python:**
```bash
pip install requests
python download_assets.py
```

This automatically downloads:
- ✅ Kenney Dungeon Kit
- ✅ Kenney Platformer Kit  
- ✅ Kenney UI Pack
- ✅ Kenney Sound Effects

### **Step 3: Manual Downloads (2 packs)**

The script will show you these links:

1. **Player Character:** [Quaternius Animated Character](https://quaternius.com/packs/ultimateanimatedcharacter.html)
   - Extract to: `assets/models/player/`

2. **Enemies:** [Quaternius Fantasy Kingdom](https://quaternius.com/packs/fantasykingdom.html)
   - Extract to: `assets/models/enemies/`

### **Step 4: Open in Godot**
- Launch **Godot 4.5.1**
- Click **Import** → Select `project.godot`
- Wait for assets to import (2-5 minutes)

### **Step 5: Build Scenes**
- Follow [SCENE_SETUP_GUIDE.md](docs/SCENE_SETUP_GUIDE.md)
- Create player, enemies, and level scenes

### **Step 6: Play!**
- Open `scenes/levels/level_01.tscn`
- Press **F6** to play!

---

## 📦 Required Assets (All Free CC0)

### Automatically Downloaded:

✅ **Kenney Dungeon Kit** - Floors, walls, doors  
✅ **Kenney Platformer Kit** - Blocks, bridges  
✅ **Kenney UI Pack** - Buttons, health bars  
✅ **Kenney Impact Sounds** - SFX

### Manual Downloads (Links provided by script):

📥 **Quaternius Ultimate Animated Character** - Player with 120+ animations  
📥 **Quaternius Fantasy Kingdom** - Enemies (skeletons, goblins)

**All assets are CC0/Public Domain - No attribution required, commercial use allowed!**

---

## 🏗️ Project Structure

```
crystal-quest-godot/
├── assets/
│   ├── models/
│   │   ├── player/          # Quaternius character models
│   │   ├── enemies/         # Enemy models with animations
│   │   ├── environment/     # Kenney dungeon/castle kits
│   │   └── props/           # Collectibles, furniture
│   ├── textures/            # Additional textures if needed
│   ├── audio/
│   │   ├── sfx/             # Sound effects
│   │   └── music/           # Background music
│   └── ui/                  # UI sprites and icons
├── scenes/
│   ├── player/
│   │   └── player.tscn      # Player scene
│   ├── enemies/
│   │   └── enemy.tscn       # Enemy template
│   ├── collectibles/
│   │   └── crystal.tscn     # Crystal collectible
│   ├── levels/
│   │   └── level_01.tscn    # First level
│   └── ui/
│       └── hud.tscn         # Game HUD
├── scripts/
│   ├── player.gd            # Player controller
│   ├── enemy.gd             # Enemy AI
│   ├── crystal.gd           # Collectible logic
│   └── hud.gd               # UI controller
├── download_assets.py       # ⚡ Auto-downloader (Python)
├── download_assets.sh       # ⚡ Auto-downloader (Linux/Mac)
├── download_assets.bat      # ⚡ Auto-downloader (Windows)
├── project.godot            # Godot project file
├── .gitignore
└── README.md
```

---

## 🎮 Controls

| Action | Input |
|--------|-------|
| **Move** | W/A/S/D or Arrow Keys |
| **Look Around** | Mouse |
| **Jump** | Space |
| **Sprint** | Left Shift |
| **Attack** | Left Mouse Button |
| **Pause/Release Mouse** | ESC |

---

## ⚙️ Input Map Configuration

The project comes pre-configured, but verify in `Project → Project Settings → Input Map`:

- `move_forward` (W, Up Arrow)
- `move_back` (S, Down Arrow)
- `move_left` (A, Left Arrow)
- `move_right` (D, Right Arrow)
- `jump` (Space)
- `sprint` (Shift)
- `attack` (Left Mouse Button)

---

## 🛠️ Scene Building Guide

Detailed instructions in [SCENE_SETUP_GUIDE.md](docs/SCENE_SETUP_GUIDE.md)

### Quick Scene Overview:

**Player Scene:**
```
Player (CharacterBody3D)
├── CollisionShape3D (CapsuleShape3D)
├── Model (imported character .glb)
├── CameraPivot/Camera3D
└── AttackArea (Area3D)
```

**Enemy Scene:**
```
Enemy (CharacterBody3D)
├── CollisionShape3D
├── Model (skeleton/goblin .glb)
├── NavigationAgent3D
└── AttackTimer
```

**Level Scene:**
```
Level (Node3D)
├── WorldEnvironment + DirectionalLight3D
├── NavigationRegion3D (bake NavMesh!)
├── Player (instance)
├── Enemies (instances)
├── Crystals (instances)
└── HUD (instance)
```

---

## 🚀 Exporting the Game

### **Windows:**
1. `Project → Export → Add → Windows Desktop`
2. Configure export path
3. Click **Export Project**

### **Linux:**
1. `Project → Export → Add → Linux/X11`
2. Export

### **Web (HTML5):**
1. Download Web export templates
2. `Project → Export → Add → Web`
3. Export and upload to itch.io or GitHub Pages

---

## 📝 Customization Guide

### **Adjust Player Speed:**
```gdscript
# In scripts/player.gd
const SPEED = 5.0        # Normal speed
const SPRINT_SPEED = 8.0 # Sprint speed
```

### **Change Enemy Difficulty:**
```gdscript
# In scripts/enemy.gd
@export var max_health = 50
@export var damage = 10
@export var move_speed = 3.0
@export var detection_range = 15.0
```

### **Add More Levels:**
1. Duplicate `level_01.tscn`
2. Redesign layout with Kenney assets
3. Add level transition triggers

---

## 🐛 Troubleshooting

**Problem:** Character falls through floor  
**Solution:** Ensure floor has `StaticBody3D` with `CollisionShape3D`

**Problem:** Enemies don't chase player  
**Solution:** 
1. Bake NavMesh (select NavigationRegion3D → Bake NavMesh)
2. Ensure Player is in "player" group

**Problem:** Animations don't play  
**Solution:** 
1. Check AnimationPlayer node paths in scripts
2. Ensure imported models have AnimationPlayer

**Problem:** Auto-downloader fails  
**Solution:** 
1. Check internet connection
2. Install Python and `requests` library
3. Download manually from [Kenney.nl](https://kenney.nl/assets)

**Problem:** Mouse stuck in game  
**Solution:** Press **ESC** to release mouse capture

---

## 📚 Learning Resources

- [Godot 4 Official Docs](https://docs.godotengine.org/en/stable/)
- [Godot 3D Tutorial Series](https://docs.godotengine.org/en/stable/tutorials/3d/index.html)
- [CharacterBody3D Guide](https://docs.godotengine.org/en/stable/classes/class_characterbody3d.html)
- [NavigationAgent3D Guide](https://docs.godotengine.org/en/stable/tutorials/navigation/navigation_using_navigationagents.html)

---

## 🤝 Contributing

Contributions are welcome! Ideas:
- Add new enemy types
- Create additional levels
- Improve AI behaviors
- Add particle effects
- Implement inventory system
- Create boss battles

---

## 📄 License

**Code:** MIT License (free to use commercially)  
**Assets:** All linked assets are CC0/Public Domain

### Asset Licenses:
- **Kenney Assets:** CC0 1.0 Universal (Public Domain)
- **Quaternius Assets:** CC0 1.0 Universal (Public Domain)

You can:
- ✅ Use commercially
- ✅ Modify freely
- ✅ No attribution required
- ✅ Redistribute

---

## 🙏 Credits

- **Game Engine:** [Godot Engine](https://godotengine.org/)
- **3D Models:** [Quaternius](https://quaternius.com/) & [Kenney](https://kenney.nl/)
- **Game Design:** Original implementation by fsub1112
- **Asset Providers:** Kenney Vleugels & Quaternius

---

## 📞 Support

If you encounter issues:
1. Check [DOWNLOAD_INSTRUCTIONS.md](DOWNLOAD_INSTRUCTIONS.md)
2. Read [SCENE_SETUP_GUIDE.md](docs/SCENE_SETUP_GUIDE.md)
3. Check Troubleshooting section above
4. Open an issue on GitHub
5. Visit [Godot Community Forum](https://forum.godotengine.org/)

---

## 🎯 Roadmap

- [x] Complete player controller
- [x] Enemy AI with pathfinding
- [x] Combat system
- [x] Collectibles
- [x] UI/HUD
- [x] Automated asset downloader
- [ ] Boss battles
- [ ] Multiple levels
- [ ] Inventory system
- [ ] Power-ups
- [ ] Save/Load system
- [ ] Main menu
- [ ] Particle effects
- [ ] Sound effects integration

---

**Enjoy building your dungeon crawler! Happy game dev! 🎮✨**

---

⭐ **If this project helps you, please star the repo!** ⭐