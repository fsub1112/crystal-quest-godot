# ⚡ QUICK START - Test in 60 Seconds!

## 🎮 **Run the Game Immediately (No Assets Required)**

The repository includes a minimal test scene that works **without downloading any assets**!

### **Step 1: Clone & Open (30 seconds)**

```bash
git clone https://github.com/fsub1112/crystal-quest-godot.git
cd crystal-quest-godot
```

Open **Godot 4.5.1** → Click **Import** → Select `project.godot`

### **Step 2: Run Test Scene (10 seconds)**

1. In Godot, open `scenes/test_minimal.tscn`
2. Press **F6** (Play Current Scene)
3. Click the game window to capture mouse
4. **WASD** to move, **Space** to jump, **Mouse** to look around!

✅ **It works!** You now have a working 3D character controller!

---

## 🎯 What You Get in Test Scene

- ✅ **Working player controller** with movement
- ✅ **Mouse look camera** (third-person)
- ✅ **Jump mechanic**
- ✅ **Sprint** (hold Shift)
- ✅ **No assets required** - uses basic shapes

### **Controls:**

- **W/A/S/D** or **Arrow Keys** - Move
- **Mouse** - Look around
- **Space** - Jump
- **Shift** - Sprint
- **ESC** - Release mouse
- **Backspace** - Debug info (console)

---

## 📋 Next Steps: Full Game

### **Option A: Quick Test (You Just Did This!)** ✅
- Play `scenes/test_minimal.tscn`
- No assets needed
- Works immediately

### **Option B: Download Assets & Build Full Game**

1. **Run Auto-Downloader:**
   ```bash
   # Windows:
   download_assets.bat
   
   # Linux/Mac:
   chmod +x download_assets.sh
   ./download_assets.sh
   
   # Or Python:
   python download_assets.py
   ```

2. **Manual Downloads (2 packs):**
   - [Quaternius Character](https://quaternius.com/packs/ultimateanimatedcharacter.html) → `assets/models/player/`
   - [Quaternius Enemies](https://quaternius.com/packs/fantasykingdom.html) → `assets/models/enemies/`

3. **Build Full Scenes:**
   - Follow [SCENE_SETUP_GUIDE.md](docs/SCENE_SETUP_GUIDE.md)
   - Create player, enemies, and level scenes
   - Use downloaded 3D models

---

## 🔧 Fixing the "Cannot Open File" Error

**Error Message:**
```
ERROR: Cannot open file 'res://scenes/levels/level_01.tscn'.
```

**Cause:** The full game scenes don't exist yet - you need to build them!

**Solution 1 - Test Immediately:**
1. Open `scenes/test_minimal.tscn`
2. Press **F6** to play
3. ✅ Works without any assets!

**Solution 2 - Change Default Scene:**
1. Go to `Project` → `Project Settings` → `Application` → `Run`
2. Change **Main Scene** to `res://scenes/test_minimal.tscn`
3. Click **Close**
4. Now **F5** (Play Project) works!

**Solution 3 - Build the Full Level:**
- Follow the detailed guide in `docs/SCENE_SETUP_GUIDE.md`
- This creates `level_01.tscn` with enemies, collectibles, etc.

---

## 🆚 What's the Difference?

| Feature | Test Scene | Full Game |
|---------|-----------|----------|
| **Works Immediately** | ✅ Yes | ❌ Needs setup |
| **Assets Required** | ❌ No | ✅ Yes (free CC0) |
| **Character Model** | Basic cylinder | Animated 3D character |
| **Enemies** | ❌ None | ✅ AI enemies |
| **Animations** | ❌ None | ✅ Walk, run, attack, death |
| **Collectibles** | ❌ None | ✅ Crystals |
| **UI/HUD** | ❌ None | ✅ Health bar, score |
| **Combat** | ❌ None | ✅ Attack system |
| **Setup Time** | ⚡ 60 seconds | 🕐 15-20 minutes |

---

## 🎓 Learning Path

### **1. Test Scene (Start Here!)** ⬅️ **YOU ARE HERE**
- Open `scenes/test_minimal.tscn`
- Press F6 and play
- Learn basic controls
- Understand scene structure

### **2. Experiment**
- Try modifying `scripts/test_player_simple.gd`
- Change SPEED values
- Add more basic shapes (CSGBox3D, CSGSphere3D)
- Test physics and collision

### **3. Download Assets**
- Run `download_assets.py` or `.bat`/`.sh`
- Get free 3D models
- Import into Godot

### **4. Build Full Game**
- Follow `SCENE_SETUP_GUIDE.md`
- Replace basic shapes with 3D models
- Add enemies and combat
- Create multiple levels

---

## 💡 Pro Tips

**Tip 1:** Change the test scene
- Open `scenes/test_minimal.tscn`
- Add more `CSGBox3D` nodes for platforms
- Create a simple parkour course!

**Tip 2:** Adjust camera distance
- Select `TestPlayer/CameraPivot/Camera3D`
- Change Position Z value (5 = close, 10 = far)

**Tip 3:** Add obstacles
- Add `StaticBody3D` + `CSGBox3D` + `CollisionShape3D`
- Create walls, ramps, pillars

**Tip 4:** Multiple test areas
- Duplicate the Floor node
- Position at different heights
- Practice jumping between platforms

---

## 🐛 Troubleshooting Test Scene

**Problem:** Player falls through floor
- **Check:** Floor has `StaticBody3D` + `CollisionShape3D`
- **Fix:** Included in test scene, should work by default

**Problem:** Can't move
- **Check:** Mouse is captured (click game window)
- **Check:** Input actions work (try arrow keys)

**Problem:** Camera doesn't follow
- **Check:** Camera3D is marked as "Current"
- **Fix:** Select Camera3D → Inspector → Check "Current"

**Problem:** Scene won't open
- **Check:** Using Godot **4.5.1** (not 4.4 or 4.3)
- **Fix:** Download correct version from [godotengine.org](https://godotengine.org/)

---

## 🚀 Ready to Build the Full Game?

Once you've tested the minimal scene:

1. ✅ Run the asset downloader
2. ✅ Read `SCENE_SETUP_GUIDE.md`
3. ✅ Build player scene with animations
4. ✅ Create enemy AI
5. ✅ Design your dungeon level!

---

**Have fun! You're now a Godot game developer! 🎮✨**
