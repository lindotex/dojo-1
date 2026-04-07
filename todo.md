# Dojo-1 Platformer MVP Todo List

This todo list outlines the steps to complete a Minimum Viable Product (MVP) for the Dojo-1 platformer game. The MVP should include core gameplay mechanics: player movement, basic level, enemies, combat, and win/lose conditions.

## Core Player Mechanics
- [ ] Implement player state machine using callable_state_machine.gd
- [ ] Add animation state transitions (idle, run, jump, fall, attack, hurt, death)
- [ ] Implement attack mechanics (basic attack, combo attacks)
- [x] Add player health system and damage handling
- [x] Add player buff system
- [ ] Implement player death and respawn logic
- [ ] Add crouch and roll mechanics
- [ ] Implement wall climbing/sliding if desired

## Level Design
- [ ] Create a basic test level in test_scene.tscn
- [ ] Add terrain tiles using Tileset assets
- [ ] Implement collision layers for platforms, walls, and hazards
- [ ] Add background layers for parallax scrolling
- [ ] Create a simple level layout with start, middle, and end sections
- [ ] Add collectibles or checkpoints (optional for MVP)

## Enemy Implementation
- [ ] Implement Knight enemy AI using state machine
- [ ] Add Knight attack patterns and movement
- [ ] Implement Skeleton enemy AI
- [ ] Add enemy health and damage systems
- [ ] Create enemy spawn points in the level
- [ ] Add enemy death animations and cleanup

## Combat System
- [ ] Implement hit detection between player attacks and enemies
- [ ] Add enemy attack collision with player
- [ ] Balance damage values and attack ranges
- [ ] Add knockback effects on hits
- [ ] Implement invincibility frames after taking damage

## UI and HUD
- [ ] Create basic HUD with health display
- [ ] Add score or enemy counter (optional)
- [ ] Implement game over screen
- [ ] Add victory screen when level is completed
- [ ] Add pause menu functionality

## Game Logic
- [ ] Implement win condition (reach level end, defeat all enemies)
- [ ] Add lose condition (player health reaches zero)
- [ ] Create level progression system
- [ ] Add camera follow for the player
- [ ] Implement basic sound effects for actions

## Polish and Testing
- [ ] Test all player mechanics thoroughly
- [ ] Balance enemy difficulty and player abilities
- [ ] Add basic audio (background music, sound effects)
- [ ] Optimize performance for smooth gameplay
- [ ] Playtest for bugs and edge cases
- [ ] Add basic tutorial or instructions

## Optional MVP+ Features (if time allows)
- [ ] Implement dash/roll ability
- [ ] Add power-ups or special items
- [ ] Create multiple levels
- [ ] Add save/load functionality
- [ ] Implement scoring system

## Deployment
- [ ] Test game build and export
- [ ] Create game icon and metadata
- [ ] Prepare for distribution (itch.io, GitHub releases, etc.)

Mark items as completed by changing [ ] to [x] as you progress through development.