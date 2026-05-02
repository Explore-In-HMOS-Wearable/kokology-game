# Kokology Game

**Kokology Game** is a HarmonyOS-based wearable application that explores personality through psychological questions
and imagination-based choices.  
It presents **6 unique categories**, each containing **5 questions** designed to reveal subconscious traits based on
user selections.

This app demonstrates essential HarmonyOS features such as:

- Page navigation with parameters
- State management using `@State`, `@Consume`, `@Provide`
- MVVM architecture with model & view model usage
- Dynamic list rendering with `ForEach`
- Custom UI for wearable devices
- `@kit.SensorServiceKit` (Vibrator) to provide physical confirmation for interactions.
- Digital Crown Navigation
- History feature using `@kit.ArkData` (Preferences) to save and track user psychological insights over time.

# Preview

<div>
<img src="screenshots/1.png" width="24%" />
<img src="screenshots/2.png" width="24%" />
<img src="screenshots/3.png" width="24%" />
<img src="screenshots/4.png" width="24%" />
</div>

# Use Cases

- **Personality Quiz**: Each category analyzes a different psychological aspect.
- **A/B Choice System**: Users select between two answers per question.
- **Result Evaluation**: Final personality results are shown dynamically based on choices.
- **Data Transfer with Models**: Safe navigation using `ResultParam` and `GameModel`.
- **Personality Archive (History)**: Saves and tracks psychological insights locally using @kit.ArkData (Preferences), allowing users to revisit their past results.

# Technology

## Stack

- **Languages**: ArkTS, ArkUI
- **Frameworks**: HarmonyOS SDK 5.1.0
- **Tools**: DevEco Studio 5.1.0
- **Libraries**:
    - @kit.ArkUI
    - @kit.SensorServiceKit'
    - @kit.ArkData

## Required Permissions

- ohos.permission.VIBRATE: Used for tactile confirmation during button interactions and selections.

# Directory Structure

``` 
KokologyGame
|--- entry/src/main/ets/
| |--- model/
| | |--- GameModel.ets
| | |--- ResultModel.ets
| | |--- ResultParam.ets
| |
| |--- viewmodel/
| | |--- GameViewModel.ets
| | |--- ResultViewModel.ets
| |
| |--- pages/
| | |--- HomePage.ets
| | |--- HistoryPage.ets
| | |--- GamePage.ets
| | |--- ResultPage.ets
| | |--- Index.ets
| |
| |--- util/
| | |--- Categories.ets
| | |--- GameData.ets
| | |--- HapticFeedback.ets
| | |--- HistoryService.ets
| | |--- ResultData.ets
| |
| |--- resources/
| |--- screenshots/
``` 

# Constraints and Restrictions

## Supported Device

- Huawei Watch 5

# LICENSE

**Kokology Game** is distributed under the terms of the MIT License.
See the [license](/LICENSE) for more information.