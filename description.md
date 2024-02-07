# Cahier des Charges - Perception Of Violence

#### Nom du groupe : KGB

#### Code du groupe : MAJ23-T3-E

#### Participants :

- Ryan GOURDON
- Romain BOADE
- Yassin KIOUA

### Sujet : 

***Sous les premières apparences du palimpseste jiu-jistique : resituer le(s) sens de la violence au travers de l’ethnographie TW : Violence***

## Objectifs du Projet

Notre groupe MAJ23-E s'engage à développer un jeu sérieux intitulé "POV : Perception of Violence" dans le but de sensibiliser les joueurs aux diverses nuances de la violence et de stimuler une réflexion critique. Les missions incluent la consolidation des notes de la rencontre avec le tuteur, la conception d'un prototype, l'achèvement du document de travail.

[URL GIT du Projet](https://github.com/yassinkioua/Jeu_serieux_POV)

### Objectif Pédagogique Général

Le joueur doit apprendre que la violence ne se limite pas seulement aux violences physiques, mais peut aussi être verbale et avoir des origines sociales diverses. La perception de la violence est subjective et varie selon les personnes et les contextes.
### Objectifs Pédagogiques Spécifiques

1. **Différents Types de Violence**
    - Violence Physique
    - Violence Verbale
    - Violence Sociale (mise à l'écart, exclusion)
    - Rapports de Force (domination, violence économique)
    - Disqualifications (violence de genre, raciale, religieuse, économique, politique/idéologique)

2. **Différents Contextes**
    - Normalisation des violences dans des environnements violents
    - Élargissement de la définition de la violence dans des environnements élitistes
    - Valorisation ou encouragement de la violence physique dans certains cas

3. **Différents Ressentis**
    - La perception de la violence dépend du vécu et des contextes de chaque individu
    - Multiplicité des visions de la violence en fonction des personnes

## Description du Jeu

### Type de Jeu
RPG/Exploration en vue du dessus

### Incarnation du Joueur
Le joueur incarne un jeune enquêteur qui doit regler les conflits pour pouvoir être admis en tant qu'enquêteur confirmer par son superviseur
### Déroulement d'une Partie

1. **Environnement**
    - Représentation d'une petite ville 
    - Stade de foot, Bureau et Salle de sport
2. **Séquence de Jeu**
    - Exploration de la carte
    - Réalisation des tâches avec des situations de violence potentielles
    - Possibilité de résoudre les conflits de manière différentes
    - Parler à son superviseur à la fin de chaque situation pour avoir un retour sur la résolution du conflit
    - Note final pour connaitre notre score
3. **Paramétrage d'une Partie**
    - Scénario générer aléatoirement sur chaque situation

## Description des Fonctionnalités

### Actions du Joueur

1. **Exploration**
   - *Déplacements :* Le joueur peut se déplacer sur la carte à l’aide des flèches directionnelles ou des touches claviers.
   - *Entrer dans des Bâtiments :* Possibilité de rentrer dans certains bâtiments de la ville en entrant en collision avec l’entrée. Bâtiments accessibles : bureau et salle de sport. Une flèche directionnel permettera d'indiquer au joueur qu'il pourra rentrer dans le batiments.

2. **Interactions**
   - *Dialogues :* Le joueur peut interagir avec certains Personnages Non Joueurs (PNJ) à l’aide de la barre d'espace pour initialiser et/ou avancer dans un dialogue. Les PNJ avec des points d'interrogation rouge son les personnages secondaires à qui on peut parler pour obtenir des informations sur la situations.
   - *Tâches :* En se rendant sur le lieu correspondant, le joueur peut commencer une tâche et la finir en suivant le dialogue et l’événement associé.
   - *Choix de résolution de conflits :* Le joueur aura plusieurs possibilité de résoudre un conflit et son choix influencera sa note final.
   
3. **Fiches : personnage et note**
   - *Fiche personnage :* Le joueur aura, à chaque début de scénario, la tâche de remettre à son superviseur les fiches des personnes en conflit. Ces fiches contiendront des informations sur les antécédents des personnes, ce qui l'aidera dans sa réflexion. Cette fiche se remplira au fur et à mesure que le joueur parlera aux personnes qui se trouvent autour de la scène pour obtenir le maximum d'informations.
   - *Fiche de note :*  À la conclusion du scénario, le joueur pourra examiner l'évaluation qu'il a reçue pour la résolution du conflit, ainsi que les phrases clés à connaître dans le scénario.
   
### Informations au Joueur

- *Liste des Informations Présentées au Joueur*
   - *Indication du scénario :* Affiche le scénarios dans lequel le joueur doit se diriger.
   - *Informations du Personnage :*  Les fiches des personnages et les comportements des personnes environnantes par rapport à leurs dialogues peuvent guider le joueur.
   - *Ping :* Des pings de nouvelles informations dans les différentes interface qui indique au joueur qu'il a eu quelque chose de nouveau.

### Moteur Interne

- *Liste des Interactions entre les Actions du Joueur et les Informations*
   - *Gestion des scénarios :*
      - *Initialisation :* Après la sélection du bouton start, génère les cas de scénarios aléatoirement.
      - *Validation :* Après avoir terminé le scénario associé, les interfaces ce mettent à jour.
      - *Fin de la Partie :* La partie se termine une fois tout les scénarios accomplies.

   - *Mise à jour des fiches personnages et note:*
      - *Ajout d'information :* Lorsque le joueur fini de parler avec un PNJ il reçoit une nouvelle informations qui sera colorée en jaune et il saura que c'est une informations qui peut être importante.
      - *Véracité de l'information :* Lorsque le joueur reçoit une information, celle-ci n'est pas nécessairement vraie. Il lui incombera de déterminer sa véracité en se basant sur les informations collectées auprès des autres PNJ ou sur le comportement de la personne avec laquelle il a interagi pendant la discussion.
      - *Mise à jour de la note :* Le joueur saura si sa résolution été la meilleurs pour le scénarios et aura le script des dialogues des 2 personnages principaux.

## Menu

#### Liste des Menus :
- Menu de démarrage avec 4 possibilité : 
  - Start : pour lancé le jeu
  - Tutoriel : apperçu des commandes du jeu
  - Options : pour gérer les paramètres
  - Exit : pour quitter le jeu

- Menu Pause :
  - Resume : reprendre la partie
  - Options : gérer les paramètre
  - Exit : quitter le jeu

- Menu End : 
  - Quitter le jeu

## Scénario :

### Stade - Thème : Racisme, Violance Physique

Dans un stade de football vibrant d'excitation lors d'un match, le joueur est confronté à des situations évoquant la violence, en particulier le racisme. Certains supporters expriment des comportements discriminatoires envers des joueurs, générant ainsi des tensions. Le joueur doit intervenir pour résoudre ces conflits en recueillant des informations auprès des personnes présentes, en dialoguant avec les supporters, et en prenant des décisions qui favorisent la compréhension et l'inclusion.

### Bureau - Thème : Violences Morale et Sociale

Le joueur se trouve dans un environnement de bureau où des dynamiques de pouvoir toxiques et des violences morales et sociales sont présentes. Les employés sont confrontés à des comportements intimidants, des brimades et des discriminations. Le joueur doit enquêter sur les relations tendues entre les collègues, collecter des preuves, et prendre des mesures pour promouvoir un environnement de travail sain. La résolution de ce scénario implique la gestion des relations professionnelles et la prévention des violences morales.

### Salle de Sport - Thème : Violences Physique

Dans un contexte de salle de sport, le joueur est témoin de situations impliquant des violences physiques. Des altercations entre athlètes ou des comportements agressifs sont présents. Le joueur doit intervenir pour désamorcer les conflits, parler avec les personnes impliquées, et éventuellement mettre en place des mesures disciplinaires. La résolution de ce scénario demande au joueur de gérer les aspects physiques des conflits, en veillant à la sécurité et à la prévention des violences.



## Fonctionnalités Additionnelles :
   - Ajout d'une téléportation entre les transitions de scènes
   - Ajout d'une touche zoom pour pouvoir regarder la map en entière 
   - Ajout d'un choix bagarre avec mini-combat possible



