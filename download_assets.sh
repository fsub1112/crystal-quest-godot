#!/bin/bash
# Crystal Quest - Asset Downloader (Bash Script)
# For Linux/Mac users who prefer shell scripts

set -e

echo "=========================================================="
echo "🎮 CRYSTAL QUEST - Automated Asset Downloader"
echo "=========================================================="
echo ""

# Check if we're in the project directory
if [ ! -f "project.godot" ]; then
    echo "❌ Error: project.godot not found!"
    echo "📁 Please run this script from the project root directory."
    exit 1
fi

# Create temp directory
mkdir -p temp_downloads

# Function to download and extract
download_and_extract() {
    local name="$1"
    local url="$2"
    local extract_to="$3"
    local filename="temp_downloads/$(basename "$url")"
    
    echo ""
    echo "=========================================================="
    echo "📦 Downloading: $name"
    echo "=========================================================="
    
    # Download
    if curl -L -o "$filename" "$url" --progress-bar; then
        echo "✅ Download complete!"
        
        # Create extraction directory
        mkdir -p "$extract_to"
        
        # Extract
        echo "📦 Extracting to $extract_to..."
        unzip -q "$filename" -d "$extract_to"
        echo "✅ Extraction complete!"
        
        return 0
    else
        echo "❌ Download failed!"
        return 1
    fi
}

echo "📥 Starting automatic downloads..."
echo ""

# Download Kenney assets
download_and_extract "Kenney Dungeon Kit" \
    "https://kenney.nl/content/3-assets/16-dungeon-kit/dungeonkit.zip" \
    "assets/models/environment/dungeon"

download_and_extract "Kenney Platformer Kit" \
    "https://kenney.nl/content/3-assets/4-platformer-kit/platformerkit.zip" \
    "assets/models/environment/platformer"

download_and_extract "Kenney UI Pack" \
    "https://kenney.nl/content/3-assets/33-ui-pack/uipack.zip" \
    "assets/ui"

download_and_extract "Kenney Impact Sounds" \
    "https://kenney.nl/content/3-assets/58-impact-sounds/impactsounds.zip" \
    "assets/audio/sfx"

# Manual download instructions
echo ""
echo ""
echo "=========================================================="
echo "📋 MANUAL DOWNLOADS REQUIRED (Quaternius Assets)"
echo "=========================================================="
echo ""
echo "Quaternius doesn't provide direct download links."
echo "Please manually download these packs:"
echo ""
echo "🔗 Ultimate Animated Character Pack"
echo "   URL: https://quaternius.com/packs/ultimateanimatedcharacter.html"
echo "   Extract to: assets/models/player"
echo ""
echo "🔗 Fantasy Kingdom Pack"
echo "   URL: https://quaternius.com/packs/fantasykingdom.html"
echo "   Extract to: assets/models/enemies"
echo ""

# Cleanup
echo "🧹 Cleaning up temporary files..."
rm -rf temp_downloads

echo ""
echo "=========================================================="
echo "🎉 Automatic downloads completed!"
echo "=========================================================="
echo ""
echo "📝 Next steps:"
echo "1. Download Quaternius assets manually (see above)"
echo "2. Open the project in Godot 4.5.1"
echo "3. Wait for assets to import"
echo "4. Follow SCENE_SETUP_GUIDE.md to build your game!"
echo ""
