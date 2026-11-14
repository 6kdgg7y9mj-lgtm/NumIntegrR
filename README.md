# NumIntegrR

## Présentation

**NumIntegrR** est un package R développé dans le cadre d'un projet sur **l'intégration numérique**.

L'intégration numérique permet d'obtenir une approximation de l'intégrale d'une fonction. Elle est particulièrement utile lorsqu'il est difficile ou impossible de calculer une intégrale de manière analytique.

L'objectif de ce package est de proposer plusieurs méthodes d'intégration numérique simples à utiliser dans l'environnement R.

---

## Méthodes disponibles

Le package propose actuellement quatre méthodes d'intégration numérique.

### 1. Méthode des rectangles

Cette méthode découpe l'intervalle d'intégration en plusieurs petits sous-intervalles et approxime l'aire sous la courbe par une somme de rectangles.

La précision dépend notamment du nombre de sous-intervalles utilisé.

### 2. Méthode des trapèzes

La méthode des trapèzes approxime la courbe par des segments de droite. L'aire sous la courbe est alors estimée par une somme de trapèzes.

Elle offre généralement une meilleure approximation que la méthode des rectangles.

### 3. Méthode de Simpson

La méthode de Simpson utilise une approximation par des polynômes de degré deux.

Elle est généralement très précise pour les fonctions régulières.

**Remarque :** le nombre de sous-intervalles `n` doit être un nombre entier positif et pair.

### 4. Méthode de Monte-Carlo

La méthode de Monte-Carlo utilise des points générés aléatoirement dans l'intervalle d'intégration.

Le résultat peut légèrement varier d'une exécution à une autre en raison du caractère aléatoire de la méthode.

---

## Installation

Pour installer le package depuis le dossier du projet, utilisez :

```r
devtools::install()
```

Une fois le package installé, chargez-le avec :

```r
library(NumIntegrR)
```

---

# Exemples d'utilisation

Dans les exemples suivants, nous considérons la fonction :

```r
f <- function(x) x^2
```

Nous souhaitons approximer l'intégrale :

$$
\int_0^4 x^2\,dx
$$

La valeur exacte de cette intégrale est :

$$
\frac{64}{3} \approx 21.33333
$$

Cette valeur exacte nous permet de comparer les résultats obtenus par les différentes méthodes numériques.

### Méthode des rectangles

```r
rectangle_integral(f, 0, 4, n = 100)
```

Résultat approximatif :

```text
21.0144
```

La méthode fournit une approximation de l'intégrale. La précision peut être améliorée en augmentant le nombre de sous-intervalles.

### Méthode des trapèzes

```r
trapezoid_integral(f, 0, 4, n = 100)
```

Résultat approximatif :

```text
21.3344
```

Ce résultat est très proche de la valeur exacte.

### Méthode de Simpson

```r
simpson_integral(f, 0, 4, n = 100)
```

Résultat :

```text
21.33333
```

Pour cet exemple, la méthode de Simpson fournit un résultat pratiquement identique à la valeur exacte.

### Méthode de Monte-Carlo

```r
monte_carlo_integral(f, 0, 4, n = 10000)
```

Le résultat obtenu sera généralement proche de :

```text
21.33333
```

Cependant, le résultat peut varier légèrement à chaque exécution, car la méthode utilise des points générés aléatoirement.

---

## Fonctions principales

| Fonction | Méthode utilisée |
|---|---|
| `rectangle_integral()` | Méthode des rectangles |
| `trapezoid_integral()` | Méthode des trapèzes |
| `simpson_integral()` | Méthode de Simpson |
| `monte_carlo_integral()` | Méthode de Monte-Carlo |

---

## Gestion des erreurs

Les fonctions du package vérifient certaines conditions avant d'effectuer les calculs :

- `f` doit être une fonction ;
- `a` et `b` doivent être des valeurs numériques avec `a < b` ;
- `n` doit être un entier positif ;
- pour la méthode de Simpson, `n` doit également être pair.

En cas de valeur incorrecte, la fonction affiche un message d'erreur à l'aide de la fonction `stop()` de R.

---

## Objectif du projet

L'objectif de **NumIntegrR** est de proposer un outil simple permettant d'explorer et de comparer différentes méthodes d'intégration numérique.

Ce projet illustre le lien entre un concept mathématique, sa programmation en R et son utilisation pratique dans un environnement scientifique ou d'ingénierie.

## Author

**Motsebo Pires**

Developer of the **NumIntegrR** package.
