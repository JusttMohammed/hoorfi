# 📱 Hoorfi App - Screen Flow & User Journey

## 🎯 App Purpose
Teach children aged 4-7 the 28 Arabic letters through gamified, interactive lessons.

---

## 🗺️ Screen Flow Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                         APP LAUNCH                               │
│                             ↓                                     │
│                    ┌────────────────┐                            │
│                    │  HOME SCREEN   │                            │
│                    │   حروفي 🌟     │                            │
│                    └────────┬───────┘                            │
│                             ↓                                     │
│                    [Start Learning]                              │
│                             ↓                                     │
│                    ┌────────────────┐                            │
│                    │ LESSON PATH    │                            │
│                    │   مسار التعلم   │                            │
│                    └────────┬───────┘                            │
│                             ↓                                     │
│                    [Select Letter]                               │
│                             ↓                                     │
│                    ┌────────────────┐                            │
│                    │ LETTER LESSON  │                            │
│                    │  شاشة الدرس    │                            │
│                    └────────┬───────┘                            │
│                             ↓                                     │
│                   [Activity: Tracing]                            │
│                             ↓                                     │
│                    ┌────────────────┐                            │
│                    │ TRACING SCREEN │                            │
│                    │  شاشة التتبع   │                            │
│                    └────────┬───────┘                            │
│                             ↓                                     │
│                    [Complete Lesson]                             │
│                             ↓                                     │
│                    ┌────────────────┐                            │
│                    │ REWARD SCREEN  │                            │
│                    │   مبروك! 🎉    │                            │
│                    └────────┬───────┘                            │
│                             ↓                                     │
│                    [Back to Path] ────────┐                      │
│                             ↑              ↓                      │
│                             └──────────────┘                      │
└─────────────────────────────────────────────────────────────────┘
```

---

## 🏠 Screen 1: Home Screen (الشاشة الرئيسية)

### Visual Layout
```
╔════════════════════════════════════════╗
║  🔊                حروفي              ║
║                                         ║
║          ┌─────────────┐               ║
║          │   😊 🌟    │   Mascot       ║
║          │  Animated   │               ║
║          └─────────────┘               ║
║                                         ║
║       "مرحباً! لنبدأ التعلم معاً"     ║
║                                         ║
║  ┌───────────────────────────────────┐ ║
║  │     الهدف اليومي                 │ ║
║  │  ████████░░░░░░  8/10             │ ║
║  ├───────────────────────────────────┤ ║
║  │  ⭐ 45    🔥 3    📚 5           │ ║
║  │  نجوم    أيام   دروس             │ ║
║  └───────────────────────────────────┘ ║
║                                         ║
║       ┌─────────────────────┐          ║
║       │   ← ابدأ التعلم     │          ║
║       └─────────────────────┘          ║
║                                         ║
╚════════════════════════════════════════╝
```

### Key Elements
- **Mascot**: Animated, bouncing character
- **Welcome Message**: Changes based on streak
- **Daily Goal**: Progress bar (visual)
- **Stats Cards**: Stars, Streak, Completed Lessons
- **Main Button**: Large, animated, primary action

### User Actions
- Tap volume to mute/unmute
- Tap main button → Navigate to Lesson Path

---

## 🗺️ Screen 2: Lesson Path (مسار الدروس)

### Visual Layout
```
╔════════════════════════════════════════╗
║  →  مسار التعلم              ⭐ 45    ║
║                                         ║
║          ┌─────────┐                   ║
║          │  😊 💪  │  Mascot           ║
║          └─────────┘                   ║
║       "اختر أول حرف لتبدأ رحلتك!"    ║
║                                         ║
║         ┌─────────┐                    ║
║         │    ا    │  ✓ ⭐⭐⭐         ║
║         │   ألف   │  (Completed)      ║
║         └─────────┘                    ║
║              │                          ║
║         ┌─────────┐                    ║
║         │    ب    │  (Unlocked)       ║
║         │   باء   │                    ║
║         └─────────┘                    ║
║              │                          ║
║         ┌─────────┐                    ║
║         │  🔒 ت   │  (Locked)         ║
║         │   تاء   │                    ║
║         └─────────┘                    ║
║              ⋮                          ║
║       [28 letters total]                ║
║                                         ║
╚════════════════════════════════════════╝
```

### Key Elements
- **Lesson Cards**: 28 cards, one per letter
- **Visual Path**: Lines connecting lessons
- **Lock Icons**: Locked lessons
- **Star Ratings**: Completed lessons show stars
- **Checkmarks**: Completion indicators
- **Mascot Message**: Contextual encouragement

### User Actions
- Scroll to view all 28 letters
- Tap unlocked letter → Navigate to Letter Lesson
- Locked letters show "مقفل" (locked) message

---

## 📚 Screen 3: Letter Lesson (شاشة الدرس)

### Visual Layout (Recognition Activity)
```
╔════════════════════════════════════════╗
║  ✕  ████████████░░░  3/3              ║
║                                         ║
║          ┌─────────┐                   ║
║          │  😊 👍  │  Mascot           ║
║          └─────────┘                   ║
║                                         ║
║         اضغط على حرف ب                ║
║                                         ║
║     ┌─────┐  ┌─────┐  ┌─────┐        ║
║     │  ا  │  │  ب  │  │  ت  │        ║
║     └─────┘  └─────┘  └─────┘        ║
║                                         ║
║     ┌─────┐  ┌─────┐  ┌─────┐        ║
║     │  ث  │  │  ج  │  │  ح  │        ║
║     └─────┘  └─────┘  └─────┘        ║
║                                         ║
║  [Feedback area appears after tap]     ║
║                                         ║
║       ┌─────────────────────┐          ║
║       │      التالي →       │          ║
║       └─────────────────────┘          ║
╚════════════════════════════════════════╝
```

### Visual Layout (Pronunciation Activity)
```
╔════════════════════════════════════════╗
║  ✕  ████████████████░  2/3            ║
║                                         ║
║          ┌─────────┐                   ║
║          │  😊 🎵  │  Mascot           ║
║          └─────────┘                   ║
║                                         ║
║            استمع وكرر                  ║
║                                         ║
║              ╔═══╗                     ║
║              ║ ب ║  Large Letter       ║
║              ╚═══╝                     ║
║                                         ║
║          ┌──────────┐                  ║
║          │    🔊    │  Audio Button    ║
║          │  Large   │                  ║
║          └──────────┘                  ║
║                                         ║
║         اضغط للاستماع                  ║
║                                         ║
║       ┌─────────────────────┐          ║
║       │      التالي →       │          ║
║       └─────────────────────┘          ║
╚════════════════════════════════════════╝
```

### Key Elements
- **Progress Bar**: Shows activity completion
- **Instructions**: Clear Arabic instructions
- **Letter Options**: Large, tappable buttons
- **Audio Button**: Large circular button
- **Feedback**: Visual + audio on tap
- **Mascot Reactions**: Changes based on answer

### User Actions
- **Recognition**: Tap correct letter
- **Pronunciation**: Tap audio button to hear
- **Navigation**: Tap التالي to proceed

---

## ✍️ Screen 4: Tracing Activity (شاشة التتبع)

### Visual Layout
```
╔════════════════════════════════════════╗
║  →  تتبع حرف الباء                     ║
║                                         ║
║          ┌─────────┐                   ║
║          │  😊 💪  │  Mascot           ║
║          └─────────┘                   ║
║                                         ║
║         تتبع الحرف بإصبعك              ║
║                                         ║
║  ╔════════════════════════════════════╗ ║
║  ║                                    ║ ║
║  ║        ب  ← Faded guide           ║ ║
║  ║       ~~~  ← User drawing         ║ ║
║  ║                                    ║ ║
║  ║   [Touch area for drawing]        ║ ║
║  ║                                    ║ ║
║  ╚════════════════════════════════════╝ ║
║                                         ║
║            [🔄 امسح]                   ║
║                                         ║
║       ┌─────────────────────┐          ║
║       │       تحقق          │          ║
║       └─────────────────────┘          ║
╚════════════════════════════════════════╝
```

### Key Elements
- **Tracing Canvas**: Large drawing area
- **Letter Guide**: Faded background letter
- **Drawing Path**: User's finger path
- **Clear Button**: Reset drawing
- **Validation**: Check completion

### User Actions
- Draw with finger to trace letter
- Tap امسح to clear and try again
- Tap تحقق when done

---

## 🎉 Screen 5: Reward Screen (شاشة المكافأة)

### Visual Layout
```
╔════════════════════════════════════════╗
║                                         ║
║  🎊 🎉                        🎉 🎊   ║
║                                         ║
║          ┌─────────────┐               ║
║          │   🥳 🎊    │   Mascot       ║
║          │  Celebrating│               ║
║          └─────────────┘               ║
║                                         ║
║              مبروك!                     ║
║                                         ║
║          تعلم حرف الباء                ║
║                                         ║
║  ┌───────────────────────────────────┐ ║
║  │       نجوم مكتسبة                 │ ║
║  │      ⭐ ⭐ ⭐                      │ ║
║  └───────────────────────────────────┘ ║
║                                         ║
║  ┌───────────────────────────────────┐ ║
║  │  💰  عملات مكتسبة                │ ║
║  │        +30                         │ ║
║  └───────────────────────────────────┘ ║
║                                         ║
║       ┌─────────────────────┐          ║
║       │   ← متابعة          │          ║
║       └─────────────────────┘          ║
║                                         ║
╚════════════════════════════════════════╝
```

### Key Elements
- **Confetti Animation**: Falling from top
- **Celebrating Mascot**: Happy expression
- **Stars Display**: Animated appearance
- **Coins Reward**: Calculated from stars
- **Continue Button**: Back to lesson path

### User Actions
- Watch celebration animation
- Tap متابعة → Return to Lesson Path

---

## 📊 User Journey Flow

### First Time User
```
1. Open App
   ↓
2. Home Screen
   → See mascot welcome
   → View daily goal (0/10)
   → 0 stars, 0 streak
   ↓
3. Tap "ابدأ التعلم"
   ↓
4. Lesson Path
   → See all 28 letters
   → Only first letter (ا) unlocked
   → Mascot says "اختر أول حرف"
   ↓
5. Tap first letter (ا - Alif)
   ↓
6. Letter Lesson
   → Activity 1: Recognition
   → Activity 2: Pronunciation
   → Activity 3: Tracing (navigate)
   ↓
7. Tracing Screen
   → Trace the letter
   → Get feedback
   ↓
8. Reward Screen
   → See stars earned (1-3)
   → Get coins (10-30)
   → Celebrate!
   ↓
9. Return to Lesson Path
   → Letter ا marked complete
   → Letter ب now unlocked
   → Continue learning...
```

### Returning User
```
1. Open App
   ↓
2. Home Screen
   → Mascot: "مرحباً بعودتك!"
   → See progress stats
   → Streak updated
   ↓
3. Tap "تابع"
   ↓
4. Lesson Path
   → See completed lessons
   → Next unlocked lesson highlighted
   → Continue from where left off
```

---

## 🎮 Gamification Elements

### ⭐ Stars (Performance Metric)
- **3 Stars**: All activities correct first try
- **2 Stars**: 70%+ correct
- **1 Star**: 50%+ correct
- **Display**: Visible on lesson cards and rewards

### 💰 Coins (Currency - Future Use)
- Earned: 10 coins per star
- Display: Total shown on home screen
- Future: Can be used for unlocking bonus content

### 🏆 Badges (Achievements)
```
First Lesson      → Complete first lesson
3-Day Streak      → Learn 3 days in a row
7-Day Streak      → Learn 7 days in a row
10 Lessons        → Complete 10 lessons
Perfect Score     → Get 3 stars in 5 lessons
100 Stars         → Collect 100 total stars
All Letters       → Complete all 28 letters
```

### 🔥 Streaks (Consistency)
- Updates daily when app is opened
- Displayed on home screen
- Mascot gives special messages for milestones

---

## 🎨 Design Principles Applied

### 1. **Large Touch Targets**
- Minimum 44x44 points
- Easy for small fingers
- Clear spacing between elements

### 2. **Immediate Feedback**
- Visual: Color changes, animations
- Audio: Sounds for actions
- Emotional: Mascot reactions

### 3. **Clear Hierarchy**
- Important actions are largest
- Progress always visible
- Next step is obvious

### 4. **Encouraging Tone**
- Positive reinforcement
- Never punitive
- "Try again" instead of "wrong"

### 5. **RTL Native**
- All text flows right-to-left
- Icons positioned correctly
- Navigation feels natural

---

## 🔄 State Management Flow

```
User Action
    ↓
Widget calls Provider method
    ↓
Provider updates state
    ↓
Provider calls Service
    ↓
Service performs business logic
    ↓
Service saves data (if needed)
    ↓
Provider notifies listeners
    ↓
Widgets rebuild with new state
    ↓
UI updates automatically
```

---

## 💾 Data Persistence

### What Gets Saved
```json
{
  "userId": "default_user",
  "totalStars": 45,
  "totalCoins": 450,
  "completedLessons": ["lesson_1", "lesson_2", "lesson_3"],
  "unlockedLessons": ["lesson_1", "lesson_2", "lesson_3", "lesson_4"],
  "currentStreak": 3,
  "longestStreak": 5,
  "lastActivityDate": "2025-12-28",
  "dailyGoal": 10,
  "todayStars": 8,
  "earnedBadges": [
    {
      "id": "first_lesson",
      "earnedDate": "2025-12-25"
    }
  ]
}
```

### When Data Saves
- After completing each lesson
- After earning stars/coins
- When earning badges
- When updating streaks
- On app pause/close

---

## 🎯 Success Metrics (Future Analytics)

### Engagement
- Daily active users
- Average session length
- Lessons completed per session
- Streak lengths

### Learning
- Time per lesson
- Attempts per activity
- Star ratings distribution
- Completion rates

### Retention
- Day 1 retention
- Day 7 retention
- Day 30 retention
- Lesson 28 completion rate

---

**This visual guide provides a complete overview of the user experience and technical flow of the Hoorfi app! 🎉**
