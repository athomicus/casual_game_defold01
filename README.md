#CASUAL MOBILE GAME
How This Game Works - Simple Explanation
🎮 What Is This Game?
This is a casual mobile dodge game where you:
Control a red circle that moves left and right
Tap the screen to switch direction
Collect red squares for points
Avoid dark squares (they end the game)
Try to beat your high score as the game gets faster
🔧 How The Code Works - Easiest Explanation
1. Game Starts (main.script)
When app opens → Load "START" menu screen
The main script is like a traffic controller - it loads and unloads different screens (start menu, game, game over).
2. Press Play → Game Loads (start/start.gui_script)
Click "Play" button → Unload menu → Load game scene
3. Game Scene Appears (game/container.script)
Game scene slides up from bottom → Circle starts moving → After 2 seconds, squares start falling
4. Player Controls (game/circle.script)
TAP SCREEN → Circle changes direction (left ↔ right)
Circle bounces between two invisible walls
Each tap makes it go the opposite way
Gets faster as you score points
5. Squares Fall Down (game/square_spawner.script)
Every 0.5 seconds → Create new square at top → Falls to middle of screen
Every 5th square = RED (collect it!)
Other squares = DARK (avoid them!)
6. When Circle Touches Square (game/square.script)
If RED square:
Collision detected → +1 Point → Speed increases → Square disappears
If DARK square:
Collision detected → Explosion effect → GAME OVER
7. Score System (game/score.script)
Each point → Number updates on screen → Saved if it's your best score
8. Game Over → Restart (gameover/gameover.gui_script)
Show final score → Can restart game
📊 Code Flow Diagram
START
  ↓
[main.script] ← Main controller
  ↓
Load START screen
  ↓
Player taps "Play"
  ↓
Load GAME screen
  ↓
┌─────────────────────────────────┐
│  GAME LOOP                       │
│  ┌──────────────────┐           │
│  │ Player taps      │           │
│  │    ↓             │           │
│  │ Circle moves     │           │
│  │    ↓             │           │
│  │ Squares spawn    │           │
│  │    ↓             │           │
│  │ Collision check  │           │
│  │    ↓             │           │
│  │ RED? → Score +1  │           │
│  │ DARK? → END GAME │           │
│  └──────────────────┘           │
└─────────────────────────────────┘
  ↓
GAME OVER screen
  ↓
Restart or Quit
🧩 Key Files & What They Do
File	What It Does
main/main.script	Traffic controller - switches between menu, game, game over
game/circle.script	Player character - moves left/right when you tap
game/square_spawner.script	Enemy factory - creates falling squares every 0.5 seconds
game/square.script	Individual square - falls down, checks collision
game/score.script	Scoreboard - tracks points and saves best score
main/data.lua	Global settings - colors, screen size, saved data
custom/render/custom.render_script	Graphics engine - draws everything on different phone sizes
💡 How Systems Talk To Each Other
The game uses messages instead of direct function calls:
-- Example: When player taps screen
msg.post('main:/sound#move', 'play_sound')  -- Tell sound system to play
Message flow example:
Square touches circle
  ↓
square.script sends → 'increase_score' message
  ↓
score.script receives message → adds 1 point
  ↓
square.script sends → 'increase_speed' message  
  ↓
circle.script receives → moves faster
⚙️ Difficulty System
Every time you collect a red square:
Circle speed: +0.45 pixels/second
Square speed: +0.54 pixels/second
Square spawn rate: +0.55 faster
This makes the game progressively harder!
🎯 Summary
Simplest explanation:
main/main.script = Game manager (loads screens)
game/circle.script = You control this (tap to move)
game/square_spawner.script = Creates falling squares
game/square.script = Each square checks if you hit it
game/score.script = Counts your points
Touch red squares = good, touch dark squares = game over
The code is well-organized with each file doing one specific job, and they all communicate using messages. This makes it easy to add new features or fix bugs!


<br><br>
<img src="docs\scheme.png" height="50%" width="50%">

