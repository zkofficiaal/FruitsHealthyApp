<img width="384" height="782" alt="Screenshot 2026-08-27 at 1 14 19 PM" src="https://github.com/user-attachments/assets/7ea5d6d3-ac8d-4c78-b9e8-0f3848f44268" />
<img width="387" height="785" alt="Screenshot 2026-08-27 at 1 14 41 PM" src="https://github.com/user-attachments/assets/84536328-f212-4373-9c9a-86d80ec0660f" />
<img width="383" height="787" alt="Screenshot 2026-08-27 at 1 15 26 PM" src="https://github.com/user-attachments/assets/cfc78836-6173-4c07-ba04-3893d126572b" />
<img width="376" height="786" alt="Screenshot 2026-08-27 at 1 15 46 PM" src="https://github.com/user-attachments/assets/341eaba0-ea1e-4746-8dd3-076d4ed2d7d3" />

## FruitsHealthyApp 🍊

A SwiftUI nutrition-tracking app for discovering fruits, logging meals, and monitoring daily calorie, macro, and water intake.

## Features

- **Onboarding** — quick setup for name, calorie goal, and water goal
- **Home** — daily progress dashboard, nutrition overview, top fruits
- **Fruits** — browse by category (Berry, Tropical, Citrus), view details, add servings
- **Nutrition** — macro breakdown donut chart, water intake tracker
- **Statistics** — weekly calorie chart and nutrient ratio (via `Charts` framework)
- **Meal Plan** — recommended meals with ingredients, add to daily log
- **Profile** — user goals and favorites summary

## Architecture

MVVM with a single shared source of truth:

```
Views → NutritionStore (ObservableObject) → Models
```

`NutritionStore` holds all live nutrition state (calories, macros, water, favorites) so every screen stays in sync — logging a fruit on the Fruits tab instantly updates Home, Nutrition, and Statistics.

## Requirements

- Xcode 16+
- iOS 16+ (uses `Charts` framework)

## Setup

1. Open `FruitsHealthyApp.xcodeproj` in Xcode
2. Add fruit/meal/avatar images to `Assets.xcassets` (see naming in `Models/Fruit.swift` and `Models/Meal.swift`)
3. Build and run (`⌘R`)

## Project Structure

```
FruitsHealthyApp/
├── App/
│   ├── AppRouter.swift
│   └── FruitsHealthyAppApp.swift
│
├── Components/
│   ├── CategoryPill.swift
│   ├── CustomTabBar.swift
│   ├── DonutProgressRing.swift
│   ├── EmptyStateView.swift
│   ├── FruitGridCard.swift
│   ├── MealRow.swift
│   ├── NutrientStatCard.swift
│   ├── PrimaryButton.swift
│   ├── QuickAddSheet.swift
│   └── ServingStepper.swift
│
├── Models/
│   ├── Fruit.swift
│   ├── FruitCategory.swift
│   ├── Meal.swift
│   └── NutritionData.swift
│
├── Resources/
│   └── Theme/
│       ├── AppColors.swift
│       └── AppFonts.swift
│
├── Store/
│   └── NutritionStore.swift
│
├── ViewModels/
│   └── OnboardingViewModel.swift
│
├── Views/
│   ├── FruitDetail/
│   │   └── FruitDetailView.swift
│   ├── Fruits/
│   │   └── FruitsView.swift
│   ├── Home/
│   │   └── HomeView.swift
│   ├── MainTabContainer/
│   │   └── MainTabContainer.swift
│   ├── MealDetailView/
│   │   └── MealDetailView.swift
│   ├── MealPlan/
│   │   └── MealPlanView.swift
│   ├── Nutrition/
│   │   └── NutritionView.swift
│   ├── Onboarding/
│   │   └── OnboardingView.swift
│   ├── Profile/
│   │   └── ProfileView.swift
│   ├── RootView/
│   │   └── RootView.swift
│   ├── Search/
│   │   └── SearchView.swift
│   └── Statistics/
│       └── StatisticsView.swift
│
└── Assets.xcassets
```
