# README 

Une fois le projet téléchargé et décompressé, ouvrir un terminal puis se placer sur le répertoire obtenu.

Lancer la commande :
```sh
$ bundle install
```
... pour installer tous les gems.

Puis celle-ci :
```sh
$ bundle update
```
... pour mettre à jour tous les gems.

Il faut effectuer toutes les migrations, pour cela, exécutez cette commande :
```sh
$ rake db:migrate
```
Pour récupérer la base de données de joueurs et des équipes, tapez cette commande :
```sh
$ rails db:seed
```
Ensuite, lancer le serveur 
```sh
$ rails s
```

Et enfin, ouvrir un navigateur et se rendre sur le localhost : 
* localhost:3000


## Fonctionnalités de l'application

* Un utilisateur lambda peut voir toutes les équipes ainsi que les joueurs. Pour pouvoir créer une équipe, il faut se logger.

* Une fois logger, on a accès à la création d'une équipe personnalisée en choisissant :
  * le nom du club,
  * le nom de l'entraîneur,
  * le pays,
  * Le logo.
  
 * 13 joueurs sont automatiquement attribués lors de la création de l'équipe ainsi que la somme de 1200€.
 * L'argent permet d'acheter d'autres joueurs qui sont dans la rubrique "joueurs".
 * L'équipe crée possède un faible niveau de statistiques générales. Pour les améliorer, il faut effectuer des entraînements (les joueurs appartenant à l'équipe n'ont pas d'incidence sur les statistiques générales).
 * Ces statistiques générales sont importantes lorsque l'on défie une équipe. Si l'équipe adverse possède des statistiques générales plus élévées que l'équipe personnelle, le match sera perdu ainsi que la somme de 1000€. Dans le cas d'une victoire, une prime de 2000€ sera obtenu.
 * Les joueurs appartenant à l'équipe perso peuvent être vendus. Dans ce cas, on obtient la moitié de sa valeur.
<<<<<<< HEAD
 * Il est possible de rechercher une équipe ou un joueur à l'aide de la barre de recherche
=======
>>>>>>> 370164cfcacbd063d809005a2818283380322dc9

# Football Evolution Team projet Ruby on Rails
