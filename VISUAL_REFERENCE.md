# Visual Design Reference

## Screen Layout Overview

```
┌─────────────────────────────────────────────────┐
│  ⚙️         ❤️٥  💎٤٥٠  🔥٣                    │ ← Sticky Header
├─────────────────────────────────────────────────┤
│                                                 │
│  ╔═══════════════════════════════════════════╗ │
│  ║  🟠🟠🟠 Orange Gradient Unit Card  🟠🟠🟠  ║ │
│  ║                                           ║ │
│  ║  الوحدة الأولى                    📖     ║ │
│  ║  الحروف الأساسية: أ، ب، ت                ║ │
│  ╚═══════════════════════════════════════════╝ │
│                                                 │
│              ⭐                                 │ ← Completed Star
│              🟡                                 │
│                                                 │
│                     ✅ ⭐                       │ ← Completed Check + Badge
│                     🟡                          │
│                                                 │
│              💬 هيا بنا نتعلم!  🐾            │ ← Mascot & Speech
│                                                 │
│         ⚪⚪⚪⚪⚪⚪⚪⚪⚪                         │ ← Pulse Ring
│           ⚪⚪⚪▶️⚪⚪⚪                          │ ← Active Play Button
│         ⚪⚪⚪⚪⚪⚪⚪⚪⚪                         │
│              درس ٣                              │
│                                                 │
│                     🔒                          │ ← Locked Node
│                     ⚫                          │
│                                                 │
│              🔒                                 │ ← Locked Node
│              ⚫                                 │
│                                                 │
│              📦                                 │ ← Treasure Box
│              🟡🟠                               │
│         كنز الوحدة                              │
│                                                 │
├─────────────────────────────────────────────────┤
│  🏠 الرئيسية  💪 تدريب  🛡️ المتصدرين  👤🔴 حسابي │ ← Bottom Nav
│  [Active]                           [Dot]      │
└─────────────────────────────────────────────────┘
```

## Color Palette

### Primary Colors
```
Orange Primary:   #F48C25  ████████
Orange Hover:     #D67618  ████████
Gold:             #FFC800  ████████
Gold Dark:        #E6B400  ████████
```

### Stat Colors
```
Hearts (Red):     #EF4444  ████████
Gems (Blue):      #1CB0F6  ████████
Fire (Orange):    #F97316  ████████
```

### Background Colors
```
Light BG:         #F8F7F5  ████████
Dark BG:          #221910  ████████
White:            #FFFFFF  ████████
Black:            #000000  ████████
```

### Node Colors
```
Completed Gold:   #FFC800  ████████
Locked Light:     #E5E7EB  ████████
Locked Dark:      #374151  ████████
```

## Component Specifications

### 1. Sticky Header
```
┌─────────────────────────────────────┐
│ ⚙️    Spacer    ❤️٥  💎٤٥٠  🔥٣    │
└─────────────────────────────────────┘
Height: ~60px (with SafeArea)
Background: White/95 opacity
Border: 1px bottom (light gray)
Shadow: 0 2px 10px rgba(0,0,0,0.05)
```

### 2. Unit Card
```
╔═══════════════════════════════════╗
║ ⚪ Decorative Circle (top-right) ║
║                                   ║
║ الوحدة الأولى              📖    ║
║ الحروف الأساسية: أ، ب، ت         ║
║                                   ║
║ ⚪ Decorative Circle (bottom-left)║
╚═══════════════════════════════════╝
Width: Max 480px - 32px margin
Height: Auto (padding 20px)
Radius: 24px
Gradient: #F48C25 → #D67618
```

### 3. Node Types

#### Completed Star (80x80)
```
    ⭐
   ⭐⭐⭐
  ⭐ ⭐ ⭐
   ⭐⭐⭐
    ⭐
    
Background: #FFC800
Border-bottom: 6px #E6B400
Icon: White star (40px)
Shadow: 0 6px 0 rgba(0,0,0,0.15)
```

#### Completed Check + Badge (80x80)
```
      ⭐ ← Badge (28x28)
    ┌─────┐
    │  ✅  │
    │     │
    └─────┘
    
Background: #FFC800
Border-bottom: 6px #E6B400
Icon: White check (40px)
Badge: White circle + gold star
```

#### Active Node (96x96)
```
  💬 هيا بنا نتعلم!  🐾 ← Mascot (64x64)
  
   ⚪⚪⚪⚪⚪
  ⚪⚪⚪⚪⚪⚪
 ⚪⚪ ▶️ ⚪⚪  ← Play button
  ⚪⚪⚪⚪⚪⚪
   ⚪⚪⚪⚪⚪
   
    درس ٣
    
Button: 96x96, #F48C25
Ring: 112x112, #F48C25/10
Pulse: 96-136px, #F48C25/20-0
Mascot: -70px top, -20px right
Float: -5px to +5px (2s)
```

#### Locked Node (80x80)
```
    ┌─────┐
    │ 🔒  │
    │     │
    └─────┘
    
Background: #E5E7EB (light) / #374151 (dark)
Border-bottom: 6px #D1D5DB / #1F2937
Icon: Gray lock (40px)
Opacity: 0.5-0.7
```

#### Treasure Box (96x80)
```
    ┌─────┐
    │ 📦  │
    │     │
    └─────┘
  كنز الوحدة
  
Width: 96px, Height: 80px
Gradient: #FBBF24 → #F97316
Border-bottom: 6px #EA580C
Radius: 24px
Icon: Inventory (48px, white)
```

### 4. Bottom Navigation
```
┌───────────────────────────────────────┐
│                                       │
│  🏠      💪      🛡️      👤         │
│ الرئيسية  تدريب  المتصدرين  حسابي  🔴│
│ [Active]                    [Dot]     │
│                                       │
└───────────────────────────────────────┘

Height: ~80px (with padding)
Background: White (light) / Black (dark)
Border-top: 2px
Radius: 24px (top only)
Shadow: 0 -5px 20px rgba(0,0,0,0.03)

Active Tab:
- Orange pill background (#F48C25/10)
- Orange icon and text (#F48C25)
- Padding: 20px horizontal, 8px vertical

Inactive Tab:
- Gray icon (#9CA3AF light / white/30 dark)
- No background
- Padding: 12px horizontal, 8px vertical

Notification Dot:
- Size: 10x10
- Color: #EF4444 (red)
- Position: top-right of icon
```

## Spacing & Layout

### Vertical Spacing
```
Sticky Header
  ↓ 24px
Unit Card
  ↓ 8px
Completed Star Node
  ↓ 32px
Completed Check Node
  ↓ 48px
Active Node (with mascot)
  ↓ 32px
Locked Node #1
  ↓ 32px
Locked Node #2
  ↓ 48px
Treasure Box
  ↓ 120px (bottom padding for nav)
```

### Horizontal Offsets
```
Completed Star:    0px (centered)
Completed Check:   +32px (right)
Active Node:       -24px (left)
Locked Node #1:    +32px (right)
Locked Node #2:    0px (centered)
Treasure Box:      0px (centered)
```

### Container Constraints
```
Max Width: 480px
Margins: 16px horizontal
Content Width: 448px (480 - 32)
```

## Animations

### 1. Float Animation (Mascot)
```
Duration: 2000ms
Repeat: Reverse
Curve: EaseInOut
Range: -5px to +5px (vertical)
```

### 2. Pulse Animation (Active Node)
```
Duration: 2000ms
Repeat: Reverse
Curve: EaseOut
Size: 96px to 136px
Opacity: 0.2 to 0.0
```

### 3. Press States
```
onTapDown:  translate(0, 3px), remove border-bottom
onTapUp:    translate(0, 0), restore border-bottom
Duration:   100ms
```

### 4. Hover Effects
```
Scale: 1.0 → 1.05
Duration: 200ms
Curve: EaseOut
```

## Typography

### Arabic Text Styles
```
Unit Title:       28px, Bold, White
Unit Subtitle:    16px, Medium, White/95
Active Label:     16px, Bold, Muted
Treasure Label:   12px, Bold, Muted
Nav Label:        12px, Bold, Orange/Gray
Speech Bubble:    14px, SemiBold, Gray-800
```

### Eastern Arabic Numerals
```
Latin → Arabic
5     → ٥
3     → ٣
450   → ٤٥٠
```

## Dark Mode Differences

### Background Colors
```
Light Mode:  #F8F7F5 (warm beige)
Dark Mode:   #221910 (dark brown)
```

### Header
```
Light: White/95
Dark:  Black/95
```

### Unit Card
```
Same gradient in both modes
(Orange is vibrant enough)
```

### Locked Nodes
```
Light: #E5E7EB (light gray)
Dark:  #374151 (dark gray)
```

### Bottom Nav
```
Light: White background
Dark:  Black background
```

### Text Colors
```
Light Mode Headers: Black/87
Dark Mode Headers:  White/87
Light Mode Muted:   Black/54
Dark Mode Muted:    White/60
```

## Implementation Notes

1. **Max Width**: Always constrain to 480px and center
2. **RTL**: Use Directionality widget for entire screen
3. **SafeArea**: Header and bottom nav need SafeArea
4. **Scrolling**: SingleChildScrollView with bottom padding
5. **Animations**: Use Tween for performance
6. **Images**: Provide fallback for network images
7. **Touch Targets**: Minimum 44x44 for accessibility
8. **Testing**: Test in light/dark modes on various screens
