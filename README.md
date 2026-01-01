# 🎮 Crystal Quest - Godot 4.5.1 3D Game

![Godot Engine](https://img.shields.io/badge/Godot-4.5.1-blue.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)
![Assets](https://img.shields.io/badge/Assets-CC0%2FPublic%20Domain-orange.svg)

A complete 3D action-adventure dungeon crawler built with Godot Engine 4.5.1 using **100% free, no-attribution-required (CC0/Public Domain) assets**.

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

## 📦 Required Assets (All Free CC0)

Download these asset packs and place them in the `assets/` folder:

### 1. **Player Character** (Rigged & Animated)
- **Source:** [Quaternius Ultimate Animated Character Pack](https://quaternius.com/packs/ultimateanimatedcharacter.html)
- **Folder:** `assets/models/player/`
- **Formats:** `.glb`, `.fbx`
- **Includes:** 120+ animations (walk, run, jump, attack, idle, death)

### 2. **Environment Assets**
- **Dungeon Kit:** [Kenney Dungeon Kit](https://kenney.nl/assets/dungeon-kit)
- **Castle Kit:** [Kenney Castle Kit](https://kenney.nl/assets/castle-kit)
- **Folder:** `assets/models/environment/`
- **Includes:** Walls, floors, doors, torches, pillars

### 3. **Enemy Models** (Rigged & Animated)
- **Source:** [Quaternius Fantasy Kingdom Pack](https://quaternius.com/packs/fantasykingdom.html)
- **Folder:** `assets/models/enemies/`
- **Includes:** Skeletons, goblins, orcs with attack animations

### 4. **Props & Collectibles**
- **Furniture:** [Kenney Furniture Kit](https://kenney.nl/assets/furniture-kit)
- **Crystals:** Included in Quaternius packs or use CSG primitives
- **Folder:** `assets/models/props/`

### 5. **UI Elements**
- **Source:** [Kenney UI Pack](https://kenney.nl/assets/ui-pack)
- **Folder:** `assets/ui/`
- **Includes:** Buttons, panels, health bars, icons

### 6. **Audio (Optional)**
- **SFX:** [Kenney Impact Sounds](https://kenney.nl/assets/impact-sounds)
- **Music:** [CC0 Music from OpenGameArt](https://opengameart.org/art-search-advanced?keys=&field_art_type_tid%5B%5D=12&sort_by=count&sort_order=DESC)
- **Folder:** `assets/audio/`

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
├── project.godot            # Godot project file
├── .gitignore
└── README.md
```

## ⚙️ Setup Instructions

### 1. **Clone the Repository**
```bash
git clone https://github.com/fsub1112/crystal-quest-godot.git
cd crystal-quest-godot
```

### 2. **Download Required Assets**
Download all assets from the links above and organize them in the `assets/` folder:
- Extract each pack into its respective subfolder
- Godot will automatically import `.glb` and `.fbx` files

### 3. **Open in Godot 4.5.1**
- Launch Godot Engine 4.5.1
- Click **Import** and select `project.godot`
- Wait for assets to import (first time may take a few minutes)

### 4. **Configure Input Map**
Go to `Project → Project Settings → Input Map` and verify these actions exist:
- `move_forward` (W, Up Arrow)
- `move_back` (S, Down Arrow)
- `move_left` (A, Left Arrow)
- `move_right` (D, Right Arrow)
- `jump` (Space)
- `sprint` (Shift)
- `attack` (Left Mouse Button)

### 5. **Build the Scenes**

#### **Player Scene** (`scenes/player/player.tscn`):
```
Player (CharacterBody3D)
├── CollisionShape3D (CapsuleShape3D, height: 2, radius: 0.5)
├── Model (Import Quaternius character .glb here)
│   └── AnimationPlayer
├── CameraPivot (Node3D)
│   └── Camera3D (Position: 0, 2, 5)
└── AttackArea (Area3D)
    └── CollisionShape3D (SphereShape3D, radius: 2.5)
```
- Attach `scripts/player.gd` to the root node
- Add Player to "player" group

#### **Enemy Scene** (`scenes/enemies/enemy.tscn`):
```
Enemy (CharacterBody3D)
├── CollisionShape3D (CapsuleShape3D)
├── Model (Quaternius skeleton/goblin .glb)
│   └── AnimationPlayer
├── NavigationAgent3D
└── AttackTimer (Timer, wait_time: 1.5)
```
- Attach `scripts/enemy.gd` to the root node
- Add to "enemies" group

#### **Crystal Scene** (`scenes/collectibles/crystal.tscn`):
```
Crystal (Area3D)
├── CollisionShape3D (SphereShape3D, radius: 0.5)
└── Model (Mesh or imported crystal model)
```
- Attach `scripts/crystal.gd`

#### **HUD Scene** (`scenes/ui/hud.tscn`):
```
HUD (CanvasLayer)
├── HealthBar (ProgressBar)
│   Position: (20, 20)
│   Size: (200, 30)
│   Style: Red fill
└── CrystalLabel (Label)
    Position: (Screen Width - 150, 20)
    Text: "Crystals: 0"
```
- Attach `scripts/hud.gd`

#### **Level Scene** (`scenes/levels/level_01.tscn`):
```
Level (Node3D)
├── WorldEnvironment
│   └── Environment (Sky, ambient light)
├── DirectionalLight3D (Shadows enabled)
├── NavigationRegion3D
│   └── Floor (CSGBox3D or Kenney floor tiles)
├── Walls (Kenney dungeon walls)
├── Player (Instance of player.tscn)
├── Enemies (3-5 instances of enemy.tscn)
├── Crystals (10+ instances of crystal.tscn)
└── HUD (Instance of hud.tscn)
```

### 6. **Bake Navigation Mesh**
- Select `NavigationRegion3D` in the Level scene
- Click **Bake NavMesh** in the top toolbar
- Ensure enemies can pathfind across the floor

### 7. **Play the Game**
- Open `scenes/levels/level_01.tscn`
- Press **F6** (Play Current Scene)
- Click the game window to capture mouse

## 🎮 Controls

| Action | Input |
|--------|-------|
| **Move** | W/A/S/D or Arrow Keys |
| **Look Around** | Mouse |
| **Jump** | Space |
| **Sprint** | Left Shift |
| **Attack** | Left Mouse Button |
| **Pause/Release Mouse** | ESC |

## 🚀 Exporting the Game

### **Windows:**
1. Go to `Project → Export → Add → Windows Desktop`
2. Configure export path
3. Click **Export Project**

### **Linux:**
1. `Project → Export → Add → Linux/X11`
2. Export

### **Web (HTML5):**
1. Download Web export templates from Godot
2. `Project → Export → Add → Web`
3. Export and upload to itch.io or GitHub Pages

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

## 🐛 Troubleshooting

**Problem:** Character falls through floor  
**Solution:** Ensure floor has `StaticBody3D` with `CollisionShape3D`

**Problem:** Enemies don't chase player  
**Solution:** Bake NavMesh and ensure Player is in "player" group

**Problem:** Animations don't play  
**Solution:** Check that `AnimationPlayer` node paths are correct in scripts

**Problem:** Mouse stuck in game  
**Solution:** Press ESC to release mouse capture

## 📚 Learning Resources

- [Godot 4 Official Docs](https://docs.godotengine.org/en/stable/)
- [Godot 3D Tutorial Series](https://docs.godotengine.org/en/stable/tutorials/3d/index.html)
- [CharacterBody3D Guide](https://docs.godotengine.org/en/stable/classes/class_characterbody3d.html)
- [NavigationAgent3D Guide](https://docs.godotengine.org/en/stable/tutorials/navigation/navigation_using_navigationagents.html)

## 🤝 Contributing

Contributions are welcome! Feel free to:
- Add new enemy types
- Create additional levels
- Improve AI behaviors
- Add particle effects
- Implement inventory system

## 📄 License

**Code:** MIT License (free to use commercially)  
**Assets:** All assets linked are CC0/Public Domain (check individual asset pack licenses)

## 🙏 Credits

- **Game Engine:** [Godot Engine](https://godotengine.org/)
- **3D Models:** [Quaternius](https://quaternius.com/) & [Kenney](https://kenney.nl/)
- **Tutorial Reference:** Original game design by fsub1112

## 📞 Support

If you encounter issues:
1. Check the Troubleshooting section
2. Open an issue on GitHub
3. Visit [Godot Community Forum](https://forum.godotengine.org/)

---

**Enjoy building your dungeon crawler! Happy game dev! 🎮✨**