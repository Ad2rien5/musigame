# musigame
Little game who generate a bullet hell out of a given chosen song

## Pattern
| Movements | Usage | Music pattern |  
| :-- | :-- | :-- |  
| Seek | A group of bullet group-up toward a specific position | Beat |  
| Flee | Enemies flee the player | Énergie élevée |  
| Arrive | Enemies slow down while approching a position | Beat or transition |  
| Wander | Ennemies have impredictible movements | Spectral Flux |  
| Pursuit | Bullets follow the player | Mediums |  
| Evade | Ennemies avoid other enemies | High |  
| Obstacle | Avoidance	Ennemis évitant des obstacles | Énergie |  
| Separation | Bullets separate themselves | high |  
| Alignment | Bullets follow the same path | regular rythme |  
| Cohesion | Bullets group up | Basses |  
| Explode | explosion of bullet | Pic d'énergie / beat |  

## Structure
### Audio analyser
```
audio_analyzer/
│
├── main.py
│
├── audio/
│   ├── loader.py
│   └── preprocessing.py
│
├── features/
│   ├── energy.py
│   ├── frequency.py
│   ├── tempo.py
│   └── spectral.py
│
├── events/
│   ├── event_detector.py
│   └── event_generator.py
│
└── exporter/
    └── json_exporter.py
```  

### Game Structure
```
game/
│
├── main.lua
│
├── states/
│   ├── menu.lua
│   ├── loading.lua
│   └── gameplay.lua
│
├── audio/
│   ├── music_manager.lua
│   └── event_manager.lua
│
├── entities/
│   ├── player.lua
│   ├── enemy.lua
│   └── bullet.lua
│
├── ai/
│   ├── seek.lua
│   ├── flee.lua
│   ├── arrive.lua
│   ├── wander.lua
│   ├── pursuit.lua
│   ├── evade.lua
│   ├── obstacle_avoidance.lua
│   ├── separation.lua
│   ├── alignment.lua
│   ├── cohesion.lua
│   └── explode.lua
│
├── patterns/
│   ├── bass_explosion.lua
│   ├── spiral_pursuit.lua
│   ├── cohesion_separation.lua
│   ├── wander_rain.lua
│   └── alignment_formation.lua
│
├── systems/
│   ├── collision_system.lua
│   ├── spawn_system.lua
│   └── difficulty_manager.lua
│
├── utils/
│   ├── vector.lua
│   └── json.lua
│
└── assets/
```  

### Data Format
temps : float  
type : string  
intensity : float  
parameters : dict{
    bullet_count : int,
    speed : int
}


**Exemple :**
```json
{
  "time": 12.5,
  "type": "bass_explosion",
  "intensity": 0.85,
  "parameters": {
    "bullet_count": 24,
    "speed": 180
  }
}
```