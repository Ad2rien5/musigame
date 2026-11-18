# musigame
Little game who generate a bullet hell out of a given chosen song

## Pattern
| Technique du cours | Utilisation dans le jeu | Influence musicale |  
| :-- | :-- | :-- |  
| Seek | Un groupe de bullets converge vers une position cible | Beat |  
| Flee | Les ennemis fuient le joueur | Énergie élevée |  
| Arrive | Un ennemi ralentit en approchant d'une position | Beat ou transition |  
| Wander | Ennemis avec trajectoires imprévisibles | Spectral Flux |  
| Pursuit | Bullets qui poursuivent le joueur | Médiums |  
| Evade | Ennemis qui esquivent le joueur ou ses attaques | Aigus |  
| Obstacle | Avoidance	Ennemis évitant des obstacles | Énergie |  
| Separation | Bullets qui s'écartent les unes des autres | Aigus |  
| Alignment | Bullets qui adoptent une direction commune | Régularité du rythme |  
| Cohesion | Bullets qui se regroupent | Basses |  
| Explode | Explosion de projectiles dans plusieurs directions | Pic d'énergie / beat |  

## Architecture
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