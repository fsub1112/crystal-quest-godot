# 📥 Asset Download Guide

## Complete Download Checklist

Follow these steps to download all required free assets for Crystal Quest:

### ✅ Step 1: Player Character (Rigged & Animated)

**Source:** Quaternius Ultimate Animated Character Pack  
**Link:** https://quaternius.com/packs/ultimateanimatedcharacter.html  
**Download:** Click "Download" button (Free, no account required)  
**What's Included:** 120+ animations including:
- Idle, Walk, Run, Sprint
- Jump, Fall, Land
- Attack (multiple variations)
- Death, Hurt
- And many more!

**Installation:**
1. Extract the downloaded ZIP file
2. Navigate to `FBX/` or `GLTF/` folder
3. Copy all `.fbx` or `.glb` files to `assets/models/player/`
4. Godot will automatically import them

---

### ✅ Step 2: Dungeon Environment Kit

**Source:** Kenney Dungeon Kit  
**Link:** https://kenney.nl/assets/dungeon-kit  
**Download:** Click blue "Download" button  
**License:** CC0 (Public Domain)

**What's Included:**
- Floor tiles (stone, wood)
- Wall sections (straight, corners)
- Doors, gates, archways
- Pillars, columns
- Torches, braziers
- Props (tables, barrels, crates)

**Installation:**
1. Extract ZIP
2. Copy all `.glb` files to `assets/models/environment/dungeon/`

---

### ✅ Step 3: Castle Kit (Optional but Recommended)

**Source:** Kenney Castle Kit  
**Link:** https://kenney.nl/assets/castle-kit  
**Download:** Free download

**What's Included:**
- Castle walls and towers
- Stairs, platforms
- Flags, banners
- Medieval decorations

**Installation:**
1. Extract and copy `.glb` files to `assets/models/environment/castle/`

---

### ✅ Step 4: Enemy Models (Rigged & Animated)

**Source:** Quaternius Fantasy Kingdom Pack  
**Link:** https://quaternius.com/packs/fantasykingdom.html  
**Download:** Click "Download" (Free)

**What's Included:**
- Skeleton warriors (multiple variants)
- Goblins
- Orcs
- All with attack, walk, idle, death animations

**Installation:**
1. Extract ZIP
2. Look for enemy models in `FBX/` or `GLTF/`
3. Copy to `assets/models/enemies/`
4. In Godot, import as `.glb` (recommended) or `.fbx`

---

### ✅ Step 5: Props & Collectibles

**Source:** Kenney Furniture Kit  
**Link:** https://kenney.nl/assets/furniture-kit  
**Download:** Free

**What's Included:**
- Tables, chairs, benches
- Chests, crates, barrels
- Shelves, bookcases
- Decorative items

**For Crystals:** Use Quaternius packs or create simple gems with Godot's CSG tools

**Installation:**
1. Copy `.glb` files to `assets/models/props/`

---

### ✅ Step 6: UI Elements

**Source:** Kenney UI Pack  
**Link:** https://kenney.nl/assets/ui-pack  
**Download:** Free

**What's Included:**
- Buttons (various states)
- Panels and frames
- Health bars
- Icons
- Sliders, checkboxes

**Installation:**
1. Extract PNG files
2. Copy to `assets/ui/`
3. Import into Godot's Theme Editor

---

### ✅ Step 7: Sound Effects (Optional)

**Source:** Kenney Impact Sounds  
**Link:** https://kenney.nl/assets/impact-sounds  
**Download:** Free

**What's Included:**
- Attack sounds
- Footsteps
- Jumps, landings
- Item collection
- UI clicks

**Installation:**
1. Copy `.wav` or `.ogg` files to `assets/audio/sfx/`

---

### ✅ Step 8: Background Music (Optional)

**Source:** OpenGameArt CC0 Music Collection  
**Link:** https://opengameart.org/art-search-advanced?keys=&field_art_type_tid%5B%5D=12&sort_by=count&sort_order=DESC  
**Filter:** Select "CC0" license

**Recommended Tracks:**
- Search "dungeon ambience"
- Search "fantasy adventure"
- Download `.ogg` format for best Godot compatibility

**Installation:**
1. Copy music files to `assets/audio/music/`

---

## 📦 Alternative: All-in-One Pack

**Kenney Game Assets All-in-1**  
**Link:** https://kenney.itch.io/kenney-game-assets  
**Price:** Pay-what-you-want (minimum $0)

**Contains:** 30,000+ assets including:
- All Kenney 3D kits
- All 2D sprites
- UI packs
- Sound effects

**Note:** Large download (~1.5GB), but includes everything you'll ever need!

---

## 🎯 Quick Start Minimal Pack

If you want to test the game quickly, download ONLY these:

1. **Quaternius Ultimate Animated Character** (player)
2. **Kenney Dungeon Kit** (environment)
3. **Quaternius Fantasy Kingdom** (enemies)

This gives you enough to build a complete playable prototype!

---

## ⚠️ Important Notes

### File Format Recommendations:
- **3D Models:** Use `.glb` (GLTF 2.0) format for best Godot compatibility
- **Audio:** Use `.ogg` format for music, `.wav` for sound effects
- **Textures:** Most models come with embedded textures

### Godot Import Settings:
- When importing `.fbx` files, Godot may ask to "Make Local" - click OK
- For animations, ensure "Import as Skeleton" is enabled
- Check "Generate LODs" for better performance

### Storage Space:
- Minimal pack: ~500MB
- Full pack with all assets: ~2-3GB
- Consider using Git LFS for large binary files

---

## 🔍 Verifying Downloads

After downloading, your `assets/` folder should look like:

```
assets/
├── models/
│   ├── player/
│   │   ├── character_001.glb
│   │   ├── character_002.glb
│   │   └── animations/ (if separate)
│   ├── enemies/
│   │   ├── skeleton.glb
│   │   ├── goblin.glb
│   │   └── orc.glb
│   ├── environment/
│   │   ├── dungeon/
│   │   │   ├── floor_tile.glb
│   │   │   ├── wall_stone.glb
│   │   │   └── door_wood.glb
│   │   └── castle/
│   └── props/
│       ├── chest.glb
│       ├── barrel.glb
│       └── crystal.glb
├── ui/
│   ├── button_normal.png
│   ├── button_hover.png
│   ├── health_bar.png
│   └── icon_crystal.png
└── audio/
    ├── sfx/
    │   ├── sword_swing.wav
    │   ├── footstep.wav
    │   └── collect.wav
    └── music/
        └── dungeon_ambience.ogg
```

---

## ✅ Next Steps

Once all assets are downloaded:
1. Open Godot 4.5.1
2. Import the project
3. Wait for assets to import (may take 2-5 minutes)
4. Follow the main README.md to build your scenes
5. Start creating!

---

## 💡 Pro Tips

- **Browse before downloading:** Visit Kenney.nl and Quaternius.com to see all available packs
- **Organize as you go:** Create subfolders for different asset types
- **Test imports:** Import one model first to ensure it works before downloading everything
- **Bookmark resources:** Save links to asset pages for future updates

---

**Happy Asset Hunting! 🎨✨**
