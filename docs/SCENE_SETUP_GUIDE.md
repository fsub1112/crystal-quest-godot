# 🏗️ Scene Setup Guide

Step-by-step instructions for creating all required scenes in Godot 4.5.1.

## 🎮 Player Scene Setup

### Create `scenes/player/player.tscn`

1. **Create New Scene** (`Scene` → `New Scene`)
2. **Add Root Node:** `CharacterBody3D` (rename to `Player`)
3. **Add Child Nodes:**

```
Player (CharacterBody3D)
├── CollisionShape3D
│   └─ Shape: CapsuleShape3D
│       • Height: 2.0
│       • Radius: 0.5
├── Model (Node3D or imported .glb scene)
│   └── AnimationPlayer (comes with imported model)
├── CameraPivot (Node3D)
│   └── Camera3D
│       • Position: (0, 2, 5)
│       • Rotation: (-10, 0, 0) degrees
└── AttackArea (Area3D)
    └── CollisionShape3D
        └─ Shape: SphereShape3D
            • Radius: 2.5
```

4. **Attach Script:**
   - Select `Player` root node
   - Click script icon or press `Ctrl+Shift+A`
   - Select `scripts/player.gd`

5. **Configure Groups:**
   - Select `Player` node
   - Go to `Node` tab (top-right)
   - Add to group: `player`

6. **Import Character Model:**
   - Drag your downloaded `.glb` character into the scene
   - Place it as child of `Player` node
   - Rename to `Model`
   - Ensure AnimationPlayer is accessible

7. **Test Camera:**
   - Select `Camera3D`
   - Click "Preview" button in viewport
   - Adjust position until you see character's back

8. **Save Scene:** `Ctrl+S` → `scenes/player/player.tscn`

---

## 👹 Enemy Scene Setup

### Create `scenes/enemies/enemy.tscn`

1. **New Scene** with `CharacterBody3D` root (name it `Enemy`)

```
Enemy (CharacterBody3D)
├── CollisionShape3D
│   └─ Shape: CapsuleShape3D (height: 2, radius: 0.5)
├── Model (imported skeleton/goblin .glb)
│   └── AnimationPlayer
├── NavigationAgent3D
│   └─ Settings:
│       • Path Desired Distance: 0.5
│       • Target Desired Distance: 1.0
└── AttackTimer (Timer)
    └─ Wait Time: 1.5
    └─ One Shot: true
```

2. **Attach Script:** `scripts/enemy.gd`

3. **Configure Exported Variables:**
   - Select `Enemy` root
   - In Inspector, set:
     - Max Health: `50`
     - Damage: `10`
     - Move Speed: `3.0`
     - Attack Range: `2.0`
     - Detection Range: `15.0`

4. **Add to Group:** `enemies`

5. **Connect Signal:**
   - Select `AttackTimer`
   - Go to `Node` tab
   - Connect `timeout()` signal to `Enemy` script

6. **Save:** `scenes/enemies/enemy.tscn`

---

## 💎 Crystal Scene Setup

### Create `scenes/collectibles/crystal.tscn`

1. **New Scene** with `Area3D` root (name it `Crystal`)

```
Crystal (Area3D)
├── CollisionShape3D
│   └─ Shape: SphereShape3D (radius: 0.5)
└── Model (CSGSphere3D or imported crystal .glb)
    └─ Material: StandardMaterial3D
        • Albedo Color: Yellow/Gold
        • Emission: Enabled (yellow glow)
        • Emission Energy: 2.0
```

**Alternative - Simple Crystal (No Import Needed):**
- Use `CSGPolygon3D` to create a diamond shape
- Or use `CSGSphere3D` with shiny material

2. **Attach Script:** `scripts/crystal.gd`

3. **Configure Exported Variables:**
   - Rotation Speed: `2.0`
   - Bob Height: `0.3`
   - Bob Speed: `2.0`

4. **Save:** `scenes/collectibles/crystal.tscn`

---

## 📊 HUD Scene Setup

### Create `scenes/ui/hud.tscn`

1. **New Scene** with `CanvasLayer` root (name it `HUD`)

```
HUD (CanvasLayer)
├── HealthBar (ProgressBar)
│   └─ Settings:
│       • Position: (20, 20)
│       • Size: (200, 30)
│       • Min Value: 0
│       • Max Value: 100
│       • Value: 100
│       • Show Percentage: false
└── CrystalLabel (Label)
    └─ Settings:
        • Position: (Screen width - 150, 20)
        • Text: "Crystals: 0"
        • Horizontal Alignment: Right
        • Font Size: 24
```

2. **Style HealthBar:**
   - Select `HealthBar`
   - In Inspector → `Theme Overrides` → `Styles`
   - Add `StyleBoxFlat` for `fill`
     - BG Color: Red
   - Add `StyleBoxFlat` for `background`
     - BG Color: Dark Gray

3. **Anchor CrystalLabel:**
   - Select `CrystalLabel`
   - In Inspector → `Layout` → `Anchors Preset`
   - Choose "Top Right"

4. **Attach Script:** `scripts/hud.gd`

5. **Save:** `scenes/ui/hud.tscn`

---

## 🎰 Level Scene Setup

### Create `scenes/levels/level_01.tscn`

1. **New Scene** with `Node3D` root (name it `Level`)

```
Level (Node3D)
├── WorldEnvironment
│   └── Environment (new)
│       └─ Settings:
│           • Background Mode: Sky
│           • Sky: ProceduralSkyMaterial (new)
│           • Ambient Light: Enabled
├── DirectionalLight3D
│   └─ Settings:
│       • Rotation: (-45, -30, 0) degrees
│       • Shadow: Enabled
├── NavigationRegion3D
│   ├── Floor (StaticBody3D)
│   │   ├── CSGBox3D or imported floor tiles
│   │   │   └─ Size: (50, 1, 50)
│   │   └── CollisionShape3D
│   │       └─ BoxShape3D (50, 1, 50)
│   └── Walls (imported Kenney dungeon walls)
├── Props (Node3D container)
│   └── (imported chests, barrels, torches)
├── Player (instance: scenes/player/player.tscn)
│   └─ Position: (0, 2, 0)
├── Enemies (Node3D container)
│   ├── Enemy1 (instance: scenes/enemies/enemy.tscn)
│   ├── Enemy2 (instance)
│   └── Enemy3 (instance)
├── Collectibles (Node3D container)
│   ├── Crystal1 (instance: scenes/collectibles/crystal.tscn)
│   ├── Crystal2 (instance)
│   └── ... (10+ crystals scattered around)
└── HUD (instance: scenes/ui/hud.tscn)
```

2. **Build Floor:**
   - Option A: Use `CSGBox3D` for quick prototype
   - Option B: Import Kenney dungeon floor tiles
   - Ensure it has `StaticBody3D` + `CollisionShape3D`

3. **Bake Navigation Mesh:**
   - Select `NavigationRegion3D`
   - Ensure floor geometry is inside it
   - Click **Bake NavMesh** button (top toolbar)
   - Blue overlay should appear on walkable areas

4. **Place Player:**
   - Instance `player.tscn`
   - Position at (0, 2, 0) or slightly above floor

5. **Place Enemies:**
   - Instance `enemy.tscn` 3-5 times
   - Spread them around the level
   - Ensure they're on NavMesh (blue area)

6. **Place Crystals:**
   - Instance `crystal.tscn` 10+ times
   - Scatter across the level
   - Vary heights slightly for visual interest

7. **Test Lighting:**
   - Adjust `DirectionalLight3D` rotation
   - Enable shadows for better depth
   - Add point lights near torches (optional)

8. **Set as Main Scene:**
   - Go to `Project` → `Project Settings` → `Application` → `Run`
   - Set Main Scene to `scenes/levels/level_01.tscn`

9. **Save:** `scenes/levels/level_01.tscn`

---

## ✅ Testing Checklist

Before playing, verify:

- [ ] Player has collision capsule
- [ ] Camera follows player smoothly
- [ ] Enemies have NavigationAgent3D
- [ ] NavMesh is baked (blue overlay visible)
- [ ] Player is in "player" group
- [ ] All scripts are attached
- [ ] Input actions are configured
- [ ] HUD is instanced in level

---

## 🎮 Play Test

1. Open `scenes/levels/level_01.tscn`
2. Press **F6** (Play Current Scene)
3. Click game window to capture mouse
4. Test:
   - WASD movement
   - Mouse camera rotation
   - Space to jump
   - Left click to attack
   - Enemy detection and chase
   - Crystal collection
   - Health bar updates when hit

---

## 🔧 Common Issues

**Player falls through floor:**
- Ensure floor has `StaticBody3D` + `CollisionShape3D`
- Check collision layers

**Enemies don't move:**
- Verify NavMesh is baked
- Check enemies are on walkable surface
- Ensure Player is in "player" group

**Camera doesn't rotate:**
- Check Input.mouse_mode is CAPTURED
- Verify CameraPivot node structure

**Animations don't play:**
- Check AnimationPlayer node paths in scripts
- Ensure imported models have AnimationPlayer
- Use `animation_player.get_animation_list()` to debug

---

**Scene setup complete! Now you're ready to play! 🎮✨**
