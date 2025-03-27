# FiveM Vehicle Repair Script

A FiveM script that adds an interactive vehicle repair system using ox_target. Players can repair vehicles by targeting the hood/bonnet, triggering a realistic repair animation and progress bar.

## Features

- Interactive vehicle repair through ox_target
- Realistic mechanic animation
- Progress bar with cancellation option
- Automatic hood/bonnet control
- Vehicle facing alignment during repair
- Visual notifications for success/failure
- Full vehicle repair including deformation

## Dependencies

- [ox_target](https://github.com/overextended/ox_target)
- [ox_lib](https://github.com/overextended/ox_lib)

## Installation

1. Ensure you have the required dependencies installed
2. Create a new folder in your server's resources directory
3. Copy the script files into the folder
4. Add the following to your `server.cfg`:
```lua
ensure ox_lib
ensure ox_target
ensure [DOJRP_Repair]
```

## Usage

1. Approach any vehicle
2. Target the hood/bonnet area
3. Click the "Repair Vehicle" option
4. Wait for the repair animation to complete
   - You can cancel the repair by moving or pressing the cancel key

## Configuration

The script includes several configurable parameters:

- Animation duration: 8000ms (8 seconds)
- Interaction distance: 2.0 units
- Target bone: 'bonnet'

## Functions

### `playMechanicAnimation()`
Plays the mechanic repair animation using the 'mini@repair' animation dictionary.

### `faceVehicle(vehicle)`
Automatically rotates the player to face the vehicle being repaired.

### `repairVehicle(vehicle)`
Main repair function that:
- Opens the hood
- Positions the player
- Plays the animation
- Shows progress bar
- Repairs the vehicle
- Handles success/failure states

## Target Configuration

The script uses ox_target's global vehicle targeting system with the following options:
- Icon: Wrench (fa-solid fa-wrench)
- Label: "Repair Vehicle"
- Bone targeting: Hood/bonnet only
- Maximum interaction distance: 2.0 units

## Notifications

The script provides visual feedback through notifications:

- Success: "Vehicle has been repaired"
- Cancelled: "Repair cancelled"

## License

This script is provided as-is under the MIT license. Feel free to modify and distribute as needed.

## Contributing

Feel free to submit issues and pull requests to improve the script.
