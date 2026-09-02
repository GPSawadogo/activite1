// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

void main() {
  runApp(const MonAppli());
}

/// Widget racine de l'application
class MonAppli extends StatelessWidget {
  const MonAppli({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magazine Infos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home: const PageAccueil(),
    );
  }
}

/// Écran d'accueil principal
class PageAccueil extends StatelessWidget {
  const PageAccueil({super.key});

  // Chemins d'accès locaux des images
  static const String mainCoverPath = 'assets/images/magazineInfo.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Magazine Infos',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            print('Menu latéral ouvert');
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              print('Recherche déclenchée');
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: const Column(
          // Grâce aux images locales (assets), toute la liste peut être optimisée avec 'const'
          children: [
            // Image principale affichée depuis le dossier local assets/images/
            Image(
              image: AssetImage(mainCoverPath),
              width: double.infinity,
              height: 220,
              fit: BoxFit.cover,
            ),
            PartieTitre(),
            PartieTexte(),
            PartieIcone(),
            PartieRubrique(),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Tu as cliqué dessus');
        },
        backgroundColor: Colors.pink,
        child: const Text(
          'click',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

// ============================================================================
// COMPOSANTS PERSONNALISÉS
// ============================================================================

/// Section Titre et Sous-titre
class PartieTitre extends StatelessWidget {
  const PartieTitre({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Bienvenue au Magazine Infos',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            'Votre magazine numérique, votre source d\'inspiration',
            style: TextStyle(
              fontSize: 13.0,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

/// Section Paragraphe Descriptif
class PartieTexte extends StatelessWidget {
  const PartieTexte({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: const Text(
        'Magazine Infos est bien plus qu\'un simple magazine d\'informations. '
        'C\'est votre passerelle vers le monde, une source inestimable de connaissances '
        'et d\'actualités soigneusement sélectionnées pour vous éclairer sur les enjeux '
        'mondiaux, la culture, la science, et même le divertissement.',
        style: TextStyle(
          fontSize: 13.5,
          height: 1.4,
          color: Colors.black,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}

/// Section Icônes d'action
class PartieIcone extends StatelessWidget {
  const PartieIcone({super.key});

  Widget _creerColonneBouton(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.pink, size: 24.0),
        const SizedBox(height: 6.0),
        Text(
          label,
          style: const TextStyle(
            color: Colors.pink,
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _creerColonneBouton(Icons.phone, 'TEL'),
          _creerColonneBouton(Icons.email, 'MAIL'),
          _creerColonneBouton(Icons.share, 'PARTAGE'),
        ],
      ),
    );
  }
}

/// Section Rubriques avec les images locales
class PartieRubrique extends StatelessWidget {
  const PartieRubrique({super.key});

  // Chemins vers les images locales des deux rubriques
  static const String rubriquePressePath = 'assets/images/rubrique1.jpg';
  static const String rubriqueModePath = 'assets/images/rubrique2.jpg';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        children: [
          // Rubrique 1 : Presse
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                rubriquePressePath,
                height: 110.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 15.0),

          // Rubrique 2 : Mode
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                rubriqueModePath,
                height: 110.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}